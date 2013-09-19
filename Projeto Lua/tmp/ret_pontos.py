import Image

im = Image.open("colisoes3.bmp")

pix = im.load()
out = file('colisoes3.out','w')

x,y = 0,0#im.size[0], im.size[1]

out.write("mapa3={};")

while x<im.size[0]:
    y = 0
    out.write('mapa3['+str(x)+']={};')
    while y<im.size[1]:
        if pix[x,y][0] == 255 and pix[x,y][1] == 0 and  pix[x,y][2] == 255:
            out.write('mapa3['+str(x)+']['+str(y)+']=true;')
        y+=1
    x+=1

out.close()


