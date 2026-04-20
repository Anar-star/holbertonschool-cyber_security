#!/usr/bin/python3
"""
Finds and replaces a string in the heap of a running process.
Usage: read_write_heap.py pid search_string replace_string
"""
import sys

def main():
    # 1. Validation
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    pid = sys.argv[1]
    search_str = sys.argv[2].encode('ascii')
    replace_str = sys.argv[3].encode('ascii')

    # 2. Get heap boundaries
    start_addr, end_addr = get_heap_range(pid)
    if not start_addr:
        print("Error: Could not find heap.")
        sys.exit(1)

    try:
        # 3. Open memory file
        with open(f"/proc/{pid}/mem", "rb+") as mem_file:
            # Move pointer to the start of the heap
            mem_file.seek(start_addr)
            heap_data = mem_file.read(end_addr - start_addr)

            # 4. Find the string
            idx = heap_data.find(search_str)
            if idx == -1:
                print(f"Error: '{sys.argv[2]}' not found in heap.")
                sys.exit(1)

            print(f"[*] Found '{sys.argv[2]}' at offset {hex(idx)}")

            # 5. Write the new string
            # Seek to start_addr + offset found
            mem_file.seek(start_addr + idx)
            mem_file.write(replace_str)
            
            # Optional: Overwrite remaining old chars with null or space 
            # if the new string is shorter, to avoid "marouaton"
            print("[*] Memory successfully overwritten.")

    except PermissionError:
        print("Error: Run as sudo to access another process's memory.")
        sys.exit(1)
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        sys.exit(1)

def get_heap_range(pid):
    """Helper to parse /proc/pid/maps"""
    try:
        with open(f"/proc/{pid}/maps", "r") as f:
            for line in f:
                if "[heap]" in line:
                    addr = line.split()[0].split("-")
                    return int(addr[0], 16), int(addr[1], 16)
    except FileNotFoundError:
        print(f"Error: PID {pid} not found.")
        sys.exit(1)
    return None, None

if __name__ == "__main__":
    main()
