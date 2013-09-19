import Image

im = Image.open("colisoes2.bmp")

pix = im.load()
out = file('colisoes2.out','w')

x,y = 0,0

out.write("mapa2={};")

while x<im.size[0]:
    y = 0
    out.write('mapa2['+str(x)+']={};')
    while y<im.size[1]:
        if pix[x,y][0] == 255 and pix[x,y][1] == 0 and  pix[x,y][2] == 255:
            out.write('mapa2['+str(x)+']['+str(y)+']=true;')
        y+=1
    x+=1

out.close()


