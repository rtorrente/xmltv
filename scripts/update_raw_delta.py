from update_all_tv_guides import update_raw_specific_delta, remove_old_raw_files
import sys

def main(delta):
    remove_old_raw_files()
    update_raw_specific_delta(int(delta))

if __name__ == '__main__':
    main(sys.argv[1:][0])