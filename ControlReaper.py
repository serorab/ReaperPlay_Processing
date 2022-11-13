# Este programa en sí no hace mucho, sólo es un experimento para conectar Python con Reaper a través de OSC.
# Tiene tres botones: Play - Pause - Exit.
import argparse
from pythonosc import udp_client
import time

# Importamos tkinter
from tkinter import *
 
# funciones
ip_info = '192.168.0.16' #Acá corresponde poner la ip Local designada por el Router.
port_info = '8005' 

def envio_play():
  client.send_message("/play", 1)

def envio_pause():
  client.send_message("/play", 0) 
  
def click_exit():
   exit() 

# Creamos una nueva instancia - Class Tk()  
win = Tk()
win.geometry("300x200")
win.title("Control - Reaper")
win.resizable(False,False)
win.config(background = "#213141")
main_title = Label(text = "Control ReaperPlay", font = ("Cambria", 14), bg = "#56CD63", fg = "black", width = "500", height = "2")
main_title.pack()

# Botones de envíos

play_btn = Button(win, text = "Play", width = "10", height = "2", command = envio_play, bg = "#00CD63")
play_btn.place(x = 20, y = 100)

pause_btn = Button(win, text = "Pause", width = "10", height = "2", command = envio_play, bg = "#00CD63")
pause_btn.place(x = 110, y = 100)

exit_btn = Button(win, text = "Exit", width = "10", height = "2", command = click_exit, bg = "#00CD63")
exit_btn.place(x = 200, y = 100)

if __name__ == "__main__":
  parser = argparse.ArgumentParser()
  parser.add_argument("--ip", default="0.0.0.0", help = "Dirección ip de destino")
  parser.add_argument("--port", type=int, default=0, help = "puerto de destino")
  args = parser.parse_args(['--ip', ip_info, '--port', port_info])

  client = udp_client.SimpleUDPClient(args.ip, args.port)

win.mainloop()
