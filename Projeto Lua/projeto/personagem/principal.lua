--o personagem principal
principal ={
	nome   = "teste",
	hp     =   100  ,
    mp     =   100	,
    exp    =   0    ,
	level  =   1    ,
	hpm    =  100   ,
	mpm    =  100   ,
	expm   =  100   ,
	x      =  100   ,
	y      =  100    ,
	dir    = "DOWN" ,-- direção da imagem
	classe =   "nitem"   ,
	radar  = (function (x,y)--radar que indica se um personagem está ou não em uma area definida por radar se estiver avisa a enviando esse personagem a co-rotina através de um resume
					return false;
			  end),
	--lista de ataques usado no modo batalha
	ataques={
		{
			nome="pulo",
			mp=0,
			tipo="normal",
			dano =10,
			img="imagens/pulo.bmp",
			desc="ataque normal que pode deixar atormentado"
		},
		{
			nome="segurar",
			mp=10,
			tipo="normal",
			dano=0,
			img="imagens/segurar.bmp",
			desc="ataque que permite segurar alguem atormentado"

		}

	},
	co_rotina = coroutine.create((function ()--chamada periodicamente pelo jogo uma vez a cada atualização  de tela caso o retorno de yield  retorna (n  personagems que estão no radar) sendo n>=0
										local mapa=1
										while(true)do
											local a=coroutine.yield()
												if (mapa==1) and (principal.x>=20) and (principal.x<=50) and (principal.y>=350) and (principal.dir=="DOWN") then
													allegro.trocarFundo("imagens/sss.bmp");
													lista_personagems.addlist(secundario)
													allegro.removerPersonagem(toad)

													principal.x=40;
													principal.y=40;
													principal.dir="DOWN"
													mapa=2
												elseif (mapa==2) and (principal.x<=54) and (principal.y<=30)and (principal.dir=="UP") then
													allegro.trocarFundo("imagens/fundo.bmp");
													allegro.removerPersonagem(secundario)
													lista_personagems.addlist(toad)
													principal.x=35;
													principal.y=345;
													principal.dir="UP"
													mapa=1
												elseif (mapa==1) and (principal.x>=830) and (principal.x<=870) and (principal.y>=350) and(principal.dir=="DOWN") then
													allegro.trocarFundo("imagens/sss.bmp");
													allegro.removerPersonagem(toad)
													principal.x=40;
													principal.y=40;
													principal.dir="DOWN"
													mapa=3
												if(secundario.hp<=0) then lista_personagems.addlist(princesa)  else a= coroutine.yield();allegro.mensagem("mario: ","hum...caverna errada!!") end

												elseif (mapa==3) and (principal.x<=54) and (principal.y<=30)and (principal.dir=="UP") then
													allegro.trocarFundo("imagens/fundo.bmp");
													allegro.removerPersonagem(princesa)
													lista_personagems.addlist(toad)

													principal.x=850;
													principal.y=345;
													principal.dir="UP"
													mapa=1
												end
											end
									end)),
	io        = coroutine.create(function (dir)--chamada apenas no modo mapa pelo personagem principal quando alguma tecla do usuario for apertada recebe sempre uma String ("UP","DOWN","LEFT","RIGHT","A","B","C","D","ENTER") de acordo com o botão apertado pode ser resumida mais uma vez ou nenhuma a cada trazição de tela
										while(true)do
											if      (dir=="UP") then
												principal.dir="UP"
												principal.y=principal.y-10;
											elseif(dir=="DOWN") then
												principal.dir="DOWN"
												principal.y=principal.y+10;
											elseif(dir=="LEFT") then
												principal.dir="LEFT"
												principal.x=principal.x-10;
											elseif(dir=="RIGHT") then
												principal.dir="RIGHT"
												principal.x=principal.x+10;
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
principal.sprites.Mov_up[i]="imagens/mario_up ("..i ..").bmp"
principal.sprites.Mov_down[i]="imagens/mario_down ("..i ..").bmp"
principal.sprites.Mov_right[i]="imagens/mario_right ("..i ..").bmp"
principal.sprites.Mov_left[i]="imagens/mario_left ("..i ..").bmp"
end
principal.sprites.Mov_up[4]="imagens/mario_up (2).bmp"
principal.sprites.Mov_down[4]="imagens/mario_down (2).bmp"
principal.sprites.Mov_right[4]="imagens/mario_right (2).bmp"
principal.sprites.Mov_left[4]="imagens/mario_left (2).bmp"
