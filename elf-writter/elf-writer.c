#include <inttypes.h>
#include <elf.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

const uint8_t code[59] = {
    0x48, 0xC7, 0xC7, 0x01, 0x00, 0x00, 0x00, 0x48, 0x8D, 0x35, 0x20, 0x00, 0x00, 0x00, 0x48, 0xC7,
    0xC2, 0x0D, 0x00, 0x00, 0x00, 0x48, 0xC7, 0xC0, 0x01, 0x00, 0x00, 0x00, 0x0F, 0x05, 0x48, 0xC7,
    0xC0, 0x3C, 0x00, 0x00, 0x00, 0x48, 0xC7, 0xC7, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x05, 0x48, 0x65,
    0x6C, 0x6C, 0x6F, 0x20, 0x57, 0x6F, 0x72, 0x6C, 0x64, 0x21, 0x0A,
};

const uint8_t string_table_content[15] = {0x00,
    '.', 't', 'e', 'x', 't', '\0', // .text  = 1
    '.', 's', 'y', 'm', 't', 'a', 'b', '\0' // .symtab = 7
}; 

#define EXECUTABLE_NAME "exe"
#define CODE_VADDR 0x601000
#define CODE_OFFSET 0x1000

int main() {
    Elf64_Ehdr elf_header = {0};
    elf_header.e_ident[EI_MAG0] = 0x7f; // 0x7f
    elf_header.e_ident[EI_MAG1] = 'E'; // 'E'
    elf_header.e_ident[EI_MAG2] = 'L'; // 'L'
    elf_header.e_ident[EI_MAG3] = 'F'; // 'F'
    elf_header.e_ident[EI_CLASS] = ELFCLASS64; // 64-bit arch
    elf_header.e_ident[EI_DATA] = ELFDATA2LSB; // 2's complement, little endian
    elf_header.e_ident[EI_VERSION] = EV_CURRENT;
    elf_header.e_ident[EI_OSABI] = ELFOSABI_SYSV; // ABI 
    elf_header.e_ident[EI_ABIVERSION] = 0;

    elf_header.e_type = ET_EXEC;
    elf_header.e_machine = EM_X86_64;
    elf_header.e_version = EV_CURRENT;
    elf_header.e_entry = CODE_VADDR; //virtual address to which system first transfers control
    elf_header.e_phoff = sizeof(Elf64_Ehdr); //program header table offset in bytes
    elf_header.e_shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr); 
    elf_header.e_flags = 0;
    elf_header.e_ehsize = sizeof(Elf64_Ehdr);
    elf_header.e_phentsize = sizeof(Elf64_Phdr);
    elf_header.e_phnum = 1; //samo jedan segment
    elf_header.e_shentsize = sizeof(Elf64_Shdr);
    elf_header.e_shnum = 3; //samo jedna sekcija
    elf_header.e_shstrndx = 2;


    Elf64_Phdr code_program_header = {0};
    code_program_header.p_type = PT_LOAD;
    code_program_header.p_flags = PF_X | PF_R;
    code_program_header.p_offset = CODE_OFFSET; 
    code_program_header.p_filesz = sizeof(code);
    code_program_header.p_memsz = sizeof(code);
    code_program_header.p_align = 0x1000;
    code_program_header.p_vaddr = CODE_VADDR; //ignored?
    code_program_header.p_paddr = 0;

    Elf64_Shdr zero_section_header = {0};

    Elf64_Shdr code_section_header = {0};
    code_section_header.sh_name = 1;
    code_section_header.sh_type = SHT_PROGBITS;
    code_section_header.sh_flags = SHF_ALLOC | SHF_EXECINSTR;
    code_section_header.sh_addr = CODE_VADDR;
    code_section_header.sh_offset = CODE_OFFSET;
    code_section_header.sh_size = sizeof(code);
    code_section_header.sh_link = 0;
    code_section_header.sh_info = 0;
    code_section_header.sh_addralign = 0x1000;
    code_section_header.sh_entsize = 0;

    Elf64_Shdr strtab_section_header = {0};
    strtab_section_header.sh_name = 7;
    strtab_section_header.sh_type = SHT_STRTAB;
    strtab_section_header.sh_flags = 0;
    strtab_section_header.sh_addr = 0;
    strtab_section_header.sh_offset = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) + 3 * sizeof(Elf64_Shdr);
    strtab_section_header.sh_size = sizeof(string_table_content);
    strtab_section_header.sh_link = 0;
    strtab_section_header.sh_info = 0;
    strtab_section_header.sh_addralign = 0x1000;
    strtab_section_header.sh_entsize = 0;

    Elf64_Shdr section_header_table[3] = {zero_section_header, code_section_header, strtab_section_header};

    int fd = open(EXECUTABLE_NAME, O_WRONLY | O_CREAT, 0777);
    if (fd == 0) {
        perror("open failed");
        exit(EXIT_FAILURE);
    }

    if (write(fd, &elf_header, sizeof(Elf64_Ehdr)) != sizeof(Elf64_Ehdr)) {
        perror("elf header write failed");
        exit(EXIT_FAILURE);
    }

    if (write(fd, &code_program_header, sizeof(Elf64_Phdr)) != sizeof(Elf64_Phdr)) {
        perror("program headr write failed");
        exit(EXIT_FAILURE);
    }

    if (write(fd, &section_header_table, sizeof(section_header_table)) != sizeof(section_header_table)) {
        perror("section header write failed");
        exit(EXIT_FAILURE);
    }

    if (write(fd, string_table_content, sizeof(string_table_content)) != sizeof(string_table_content)) {
        perror("code write failed");
        exit(EXIT_FAILURE);
    }

    if (lseek(fd, CODE_OFFSET, SEEK_SET) != CODE_OFFSET) {
        perror("lseek failed");
        exit(EXIT_FAILURE);
    }

    if (write(fd, code, sizeof(code)) != sizeof(code)) {
        perror("code write failed");
        exit(EXIT_FAILURE);
    }

    if (close(fd) != 0) {
        perror("close failed");
        exit(EXIT_FAILURE);
    }

    return 0;
}
