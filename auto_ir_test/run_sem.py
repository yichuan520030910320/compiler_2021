import os,sys,time,pyperclip
from pymouse import PyMouse
from pykeyboard import PyKeyboard
m = PyMouse()
k = PyKeyboard()
def p(*l):
    time.sleep(0.2)
    for i in l:
        k.press_key(i)
    for i in reversed(l):
        k.release_key(i)
def alttab():
    p(k.alt_key,k.tab_key)
def getState(s,source):
    if 'Success' in s:
        return 'Success'
    if 'Fail' in s:
        return 'Fail'
    print('Find no "Success" or "Fail" in',source)
    raise(RuntimeError)
def getfileoutput(filename):
    time.sleep(0.2)
    m.click(1000,500)
    p(k.shift_key, k.function_keys[10])
    time.sleep(1)
    m.click(1000,700)
    time.sleep(0.2)
    k.type_string(filename)
    k.tap_key(k.enter_key)
    time.sleep(1.5)
    m.click(1000,700)
    p(k.control_key, 'a')
    p(k.control_key, 'c')
    time.sleep(0.2)
    s = pyperclip.paste()
    return getState(s,'myoutput')

def getans(filename):
    with open(filename, 'r') as f:
        s = f.read()
        return getState(s,'answer')

def check(filename):
    try:
        ans = getans(filename)
    except RuntimeError:
        print('Warning: jumped file testing', filename)
        return
    myans = getfileoutput(filename)
    if ans == myans:
        print('passed', filename)
    else:
        print('Failed', filename, '------------ ans =', ans, 'myoutput =', myans)
        alttab()
        sys.exit()
allpath=[]
allname=[]

def getallfile(path):
    allfilelist=os.listdir(path)
    for file in allfilelist:
        filepath=os.path.join(path,file)
        if os.path.isdir(filepath):
            getallfile(filepath)
        elif os.path.isfile(filepath):
            if filepath.endswith('.mx'):
                allpath.append(filepath)
                allname.append(file)
    return allpath, allname

getallfile('sema\\')

allpath.sort()

alttab()
for filepath in allpath:
    check(filepath)
print('All Correct!')