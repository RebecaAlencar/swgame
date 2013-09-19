--o personagem principal
luke ={
	possuiMensagem = false,
	luke_sprite = "mario",
	nome   = "Luke",
	hp     =   100  ,
    mp     =   100	,
    exp    =   0    ,
    estado= 0,
	level  =   1    ,
	hpm    =  100   ,
	mpm    =  100   ,
	expm   =  100   ,
	x      =  0   ,
	y      =  800    ,
	dir    = "DOWN" ,-- direção da imagem
	classe =   "nitem"   ,
	radar  = (function (x,y)--radar que indica se um personagem está ou não em uma area definida por radar se estiver avisa a enviando esse personagem a co-rotina através de um resume
					return false;
			  end),
	--lista de ataques usado no modo batalha
	ataques={
		{
			nome="Granada Espacial",
			mp=0,
			tipo="forte",
			dano =60,
			img="imagens/granada.bmp",
			desc="Granada Espacial originaria de Tatooine"
		},
		{
			nome="tiros",
			mp=10,
			tipo="medio",
			dano=50,
			img="imagens/tiros.bmp",
			desc="Tiros Disparados da Nave"

		}

	},
	co_rotina = coroutine.create((function ()--chamada periodicamente pelo jogo uma vez a cada atualização  de tela caso o retorno de yield  retorna (n  personagems que estão no radar) sendo n>=0
										local mapa=1
										local lastx =0
										local lasty=0
										while(true)do
											local a=coroutine.yield()
												if(luke.estado==0) then
													allegro.trocarFundo("imagens/lukehistoria.bmp");
													allegro.wait(600)
													luke.estado=1
												elseif(luke.estado==1)then
													luke.x=100;
													luke.y=100;								
													allegro.wait(6000)
													allegro.trocarFundo("imagens/sw_desert3.bmp");	
													luke.estado=3
												elseif(luke.estado==4)then
													lista_personagems.addlist(deathstar);
													lista_personagems.addlist(millenium)
													allegro.addPersonagem(millenium)
													allegro.setarPrincipal(millenium)
													allegro.removerPersonagem(luke)
													luke.luke_sprite="millenium"
													millenium.x=40;
													millenium.y=40;
													millenium.dir="DOWN"		
													allegro.wait(6000)
													allegro.trocarFundo("imagens/sw_stars.bmp");
													luke.estado=3
												else
													if(luke.x ~= lastx or luke.y ~= lasty) then
														print (luke.x, luke.y)
														lastx = luke.x
														lasty = luke.y
													end
													if (mapa==1) and (luke.x>=950) and (luke.x<=970) and (luke.y<60) and (luke.dir=="UP") then
														allegro.trocarFundo("imagens/sss2.bmp");
														lista_personagems.addlist(ben);
														allegro.removerPersonagem(r2d2);
														luke.x=40;
														luke.y=240;
														luke.dir="UP"
														map,mapa=2,2
													elseif (mapa==2) and (luke.x<=40) and (luke.y>210)and (luke.dir=="DOWN") then
															allegro.removerPersonagem(ben)
															luke.x=0;
															luke.y=800;
															allegro.trocarFundo("imagens/lukehistoria2.bmp");	
															luke.estado=4												
															map,mapa=3,3
													elseif (mapa==1) and (luke.x>=830) and (luke.x<=870) and (luke.y>=350) and(luke.dir=="DOWN") then
														allegro.trocarFundo("imagens/sss.bmp");
														allegro.removerPersonagem(r2d2)
														luke.x=40;
														luke.y=40;
														luke.dir="DOWN"
														map,mapa=3,3
													if(secundario.hp<=0) then lista_personagems.addlist(princesa)  else a= coroutine.yield();allegro.mensagem("mario: ","hum...caverna errada!!") end

													end
												end
											end
									end)),
	io        = coroutine.create(function (dir)--chamada apenas no modo mapa pelo personagem principal quando alguma tecla do usuario for apertada recebe sempre uma String ("UP","DOWN","LEFT","RIGHT","A","B","C","D","ENTER") de acordo com o botão apertado pode ser resumida mais uma vez ou nenhuma a cada trazição de tela
										while(true)do
											print(luke.luke_sprite)
											--controle de colisao individual para cada mapa
											if (map == 1) then
												map_col = mapa1;
											elseif (map == 2) then
												map_col = mapa2;
											elseif (map == 3) then
												map_col = mapa3;
											else 
												map_col = map2;
											end

											if (dir=="UP") then
												luke.dir="UP"
												luke.y=luke.y-10;
												if(map_col[luke.x][luke.y]) then
													luke.y=luke.y+10;
												end
											elseif(dir=="DOWN") then
												luke.dir="DOWN"
												luke.y=luke.y+10;
												if(map_col[luke.x][luke.y]) then
													luke.y=luke.y-10;
												end
											elseif(dir=="LEFT") then
												luke.dir="LEFT"
												luke.x=luke.x-10;
												if(map_col[luke.x][luke.y]) then
													luke.x=luke.x+10;
												end
											elseif(dir=="RIGHT") then
												luke.dir="RIGHT"
												luke.x=luke.x+10;
												if(map_col[luke.x][luke.y]) then
													luke.x=luke.x-10;
												end
											end
											dir=coroutine.yield()
										end
								end),


--não modificaveis em tempo de co-rotina ( lidos apenas uma vez)
	sprites={--conjunto de sprites pra cada movimento do personagem
		Mov_up={ },
		Mov_down={ },
		Mov_left={ },
		Mov_right={ },
		Mov_a={ "imagens/mario_right (1).bmp"},-- usado no modo batalha
		Mov_b={"imagens/mario_down (1).bmp"},

	}

}

for i=1,3 do
print ("dariro")
luke.sprites.Mov_up[i]="imagens/"..luke.luke_sprite.."_up ("..i ..").bmp"
luke.sprites.Mov_down[i]="imagens/"..luke.luke_sprite.."_down ("..i ..").bmp"
luke.sprites.Mov_right[i]="imagens/"..luke.luke_sprite.."_right ("..i ..").bmp"
luke.sprites.Mov_left[i]="imagens/"..luke.luke_sprite.."_left ("..i ..").bmp"
end

luke.sprites.Mov_up[4]="imagens/"..luke.luke_sprite.."_up (2).bmp"
luke.sprites.Mov_down[4]="imagens/"..luke.luke_sprite.."_down (2).bmp"
luke.sprites.Mov_right[4]="imagens/"..luke.luke_sprite.."_right (2).bmp"
luke.sprites.Mov_left[4]="imagens/"..luke.luke_sprite.."_left (2).bmp"
