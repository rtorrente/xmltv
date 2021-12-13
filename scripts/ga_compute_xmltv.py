from update_all_tv_guides import remove_root_xmltv_files, parse_raw_xmltv_files, generate_new_xmltv_files, generate_root_xmltv_files_md5
from datetime import datetime
import sys

def main():
    print('\n# Start script at', datetime.now().strftime("%d/%m/%Y %H:%M:%S"), flush=True)
    remove_root_xmltv_files()
    (all_data, all_channels, all_programmes, all_programmes_local) = parse_raw_xmltv_files()
    generate_new_xmltv_files(all_data, all_channels, all_programmes, all_programmes_local)
    generate_root_xmltv_files_md5()
    print('\n# Exit script at', datetime.now().strftime("%d/%m/%Y %H:%M:%S"), flush=True)

if __name__ == '__main__':
    main()