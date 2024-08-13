import os
import sys
import random
import time

def makeString(length) -> str:
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    s = ""
    for c in range(length):
        s = s + chars[random.randint(1,len(chars) - 1)]
    return s

def main(args) -> None:
    if len(args) > 0:
        # hack :)
        identity = "com.kiwiworksinc.andromeda"
        appdata = os.getenv("appdata")
        path = appdata + "/LOVE/" + identity + "/editor/edited/"
        if args[0] == "create" or args[0] == "make":
            random.seed(int(time.time()))
            for f in range(int(args[1])):
                file = makeString(10) + ".lvl"
                epath = path + file
                print("[CREATED] : " + file)
                with open(epath, "wb") as fsout:
                    fsout.write(os.urandom(random.randint(1024, 10240)))
        elif args[0] == "clear" or args[0] == "delete":
            filenames = next(os.walk(path), (None, None, []))[2]
            for f in filenames:
                print("[REMOVED] : " + f)
                os.remove(path + f)
        print("[Task ended with sucess]")
    else:
        print("Please specify a valid mode -> [create, clear]")

if __name__ == "__main__":
    main(sys.argv[1:])