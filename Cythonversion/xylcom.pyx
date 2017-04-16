import pygame
import pyaudio
import wave
import cython
cimport cython
from pygame.locals import *



cdef int xa1=93,xa2=193,xb1=194,xb2=297,xc1=298,xc2=403,xd1=404,xd2=508,xe1=509,xe2=613,xf1=614,xf2=718,xg1=719,xg2=824,xh1=825,xh2=922

@cython.boundscheck(False)
cdef synth(int buffer,str path,int posx1,int posx2):
    cdef int xp,yp,channels
    cdef long long int rate

    logic=True
    p = pyaudio.PyAudio()
    wf=wave.open(path, 'rb')
    stream = p.open(format=p.get_format_from_width(wf.getsampwidth()),
                     channels=wf.getnchannels(),
                     rate=wf.getframerate(),
                     output=True)

    while logic:
        evnt = pygame.event.poll()
        if evnt.type==QUIT:
            logic=False
        if evnt.type==pygame.MOUSEMOTION:
            xp, yp = pygame.mouse.get_pos()
        if (xp >= posx1) and (xp<= posx2):
            data=wf.readframes(buffer)
            if len(data)>0:
                stream.write(data)
            else:
                stream.stop_stream()
                stream.close()
                wf.close()
                p.terminate()
                break
        else:
            stream.stop_stream()
            stream.close()
            wf.close()
            p.terminate()
            break

@cython.boundscheck(False)
cdef main():
    cdef int x,y
    done = True
    while done:
        event=pygame.event.poll()
        if event.type == QUIT:
            done=False
        if event.type == pygame.MOUSEMOTION:
            x,y=pygame.mouse.get_pos()

        try:
            if ((x>=93) and (x<=922)) and((y>=342) and (y<=715)):
                if (x>=xa1) and(x<=xa2):
                    synth(512,"c.wav",xa1,xa2)

                elif (x>=xb1) and(x<=xb2):
                    synth(512,"d.wav",xb1,xb2)

                elif (x>=xc1) and(x<=xc2):
                    synth(512,"e.wav",xc1,xc2)

                elif (x>=xd1) and(x<=xd2):
                    synth(512,"f.wav",xd1,xd2)

                elif (x>=xe1) and(x<=xe2):
                    synth(512,"g.wav",xe1,xe2)


                elif (x>=xf1) and(x<=xf2):
                    synth(512,"a.wav",xf1,xf2)

                elif (x>=xg1) and(x<=xg2):
                    synth(512,"b.wav",xg1,xg2)

                elif (x>=xh1) and(x<=xh2):
                    synth(512,"c2.wav",xh1,xh2)
        except:
            pass
        pygame.display.update()




def mainloop():
    return main()