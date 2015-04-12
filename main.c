#include "types.h"
#include "memory.h"
#include "io.h"

void print_int(long x) {
  if (x == 0) {
    print("0", 1);
    return;
  }
  int neg = 0;
  if (x < 0) {
    if (x == -2147483648) {
      print("-2147483648", 11);
      return;
    }
    neg = 1;
    x = -x;
  }
  char buffer[12];
  int pos = sizeof(buffer) - 1;
  while (x > 0 && pos > 1) {
    buffer[pos--] = (x % 10) + '0';
    x /= 10;
  }
  if (neg)
    buffer[pos--] = '-';
  print(buffer + pos, sizeof(buffer) - pos);
}

int main(int argc, char** argv) {
  if (argc < 2)
    return 1;

  // Open file.
  int fd = open(argv[1], O_RDONLY, 0);
  if (fd < 0)
    return 2;

  // Get file size.
  struct stat fs;
  memset(&fs, 0, sizeof(fs));
  int ec = fstat(fd, &fs);
  if (ec < 0) {
    close(fd);
    return 3;
  }
  size_t file_size = fs.st_size;

  // Allocate memory for the file.
  char* buffer = malloc(file_size);
  if (!buffer) {
    close(fd);
    return 4;
  }

  // Read file into heap memory.
  ssize_t read_size = read(fd, buffer, file_size);
  if (read_size < 0) {
    close(fd);
    return 5;
  }

  // Close file.
  close(fd);

  // Print file contents.
  print(buffer, read_size);
  return 0;
}
