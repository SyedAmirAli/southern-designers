# import os
# import shutil

# directory = "/htdocs/pathgriho/public/media/image-gallery/images"
# get_files = []


# for root, dirs, files in os.walk(directory):
#     for file in files:
#         get_files.append(os.path.join(root, file))

# print(len(get_files))


# try:
#     shutil.rmtree(directory)
#     print("Directory Deleted Successfully!")
# except OSError as e:
#     print("Something was wrong!", e)

import os, re

filedir = "/htdocs/pathgriho/public/fonts/ador-noirrit/"

for filename in os.listdir(filedir):
    if os.path.isfile(os.path.join(filedir, filename)):
        new_name = re.sub(
            r"^Li Ador Noirrit ", "", filename, flags=re.IGNORECASE
        ).lower()
        new_name = re.sub(r"[^a-z-]", "", new_name.replace("ttf", ""))
        os.rename(
            os.path.join(filedir, filename), os.path.join(filedir, new_name + ".ttf")
        )

print("File renamed successfully!")
