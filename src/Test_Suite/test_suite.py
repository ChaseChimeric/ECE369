
import tkinter as tk
from tkinter import *
from tkinter import ttk
import tkinter.messagebox 
import os


#get tests
tests = os.listdir("references")



window = tk.Tk()
frame = tk.Frame(window, width=600, height=400)
frame.pack(fill=tk.BOTH, side=tk.LEFT, expand=True)

#######################################################
def compile_script():
    selected_test = n.get()
    filepath = fileEntry.get()
    filepath = filepath.replace('"', "")
    if ".xpr" not in filepath:
        tk.messagebox.showinfo("","Invalid filepath")
        return
    if not os.path.exists(filepath):
        tk.messagebox.showinfo("","Invalid filepath2")
        return
    if selected_test == "":
        tk.messagebox.showinfo("","Must select test to compare results")
        return
    filepath = filepath.replace('\\', '\\\\')
    command = f'open_project {filepath}\nlaunch_simulation -mode "post-synthesis" -type "functional"\nrestart\nrun 50us > output_tmp.csv\nexit'
    with open("temp_script.tcl", "w") as script_write:
        script_write.write(command)
    os.system(f"C:\\Xilinx\\Vivado\\2024.1\\bin\\vivado.bat -mode tcl -script {os.getcwd()}\\temp_script.tcl")
    inputFile1 = open(f"references\\{selected_test}", 'r')
    with open("output_tmp.csv", 'r') as inputFile2:
        input1 = inputFile1.read()
        input2 = inputFile2.read()
        input2 = input2.replace(' ', '')
        input2 = input2.replace('\t', '')
        input2 = input2[0:input2.index("\n$stop")]
        if input1 != input2:
            tk.messagebox.showinfo("","test failed, running diff")
            os.system(f"git diff --no-index references\\{selected_test} output_tmp.csv")
    inputFile1.close()
    print(filepath) 
   ################################################ 

fileLabel = tk.Label(
    master=frame,
    text="Enter path of .xpr file:"
)
fileLabel.place(x=50,y=10)
fileEntry = tk.Entry(
    master=frame,
    width=50
)
fileEntry.place(x=50,y=40)

testLabel = tk.Label(master = frame, text = "Select test base results:")
testLabel.place(x=50,y=65)

n = tk.StringVar()
testselect = ttk.Combobox(master=frame, width=20, textvariable = n)

testselect['values'] = tests
testselect.place(x=50,y=90)
testselect.current()

button = tk.Button(
    master = frame,
    text="run test",
    width=25,
    height=5,
    bg="white",
    fg="black",
    command=compile_script
)
button.place(x=50,y=115)







def main(): 
    window.mainloop()
if __name__ == '__main__':
    main()