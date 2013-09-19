--o personagem principal
millenium ={
	possuiMensagem = false,

	nome   = "millenium",
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
			nome="Granada Espacial",
			mp=0,
			tipo="forte",
			dano =60,
			img="imagens/granadas.bmp",
			desc="Granada Espacial originaria de Tatooine"
		},
		{
			nome="tiros",
			mp=10,
			tipo="medio",
			dano=50,
			img="imagens/Tiros.bmp",
			desc="Tiros Disparados da Nave"

		}

	},
	co_rotina = coroutine.create((function ()--chamada periodicamente pelo jogo uma vez a cada atualização  de tela caso o retorno de yield  retorna (n  personagems que estão no radar) sendo n>=0
										local mapa=1
										local lastx =0
										local lasty=0
										while(true)do
											local a=coroutine.yield()
												if(millenium.x ~= lastx or millenium.y ~= lasty) then
													print (millenium.x, millenium.y)
													lastx = millenium.x
													lasty = millenium.y
												end
												
										end
									end)),
	io        = coroutine.create(function (dir)--chamada apenas no modo mapa pelo personagem principal quando alguma tecla do usuario for apertada recebe sempre uma String ("UP","DOWN","LEFT","RIGHT","A","B","C","D","ENTER") de acordo com o botão apertado pode ser resumida mais uma vez ou nenhuma a cada trazição de tela
										while(true)do

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
												millenium.dir="UP"
												millenium.y=millenium.y-10;
												if(map_col[millenium.x][millenium.y]) then
													millenium.y=millenium.y+10;
												end
											elseif(dir=="DOWN") then
												millenium.dir="DOWN"
												millenium.y=millenium.y+10;
												if(map_col[millenium.x][millenium.y]) then
													millenium.y=millenium.y-10;
												end
											elseif(dir=="LEFT") then
												millenium.dir="LEFT"
												millenium.x=millenium.x-10;
												if(map_col[millenium.x][millenium.y]) then
													millenium.x=millenium.x+10;
												end
											elseif(dir=="RIGHT") then
												millenium.dir="RIGHT"
												millenium.x=millenium.x+10;
												if(map_col[millenium.x][millenium.y]) then
													millenium.x=millenium.x-10;
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
		Mov_a={ "imagens/millenium.bmp"},-- usado no modo batalha
		Mov_b={"imagens/millenium.bmp"},

	}

}
for i=1,3 do
millenium.sprites.Mov_up[i]="imagens/millenium_up (1).bmp"
millenium.sprites.Mov_down[i]="imagens/millenium_down (1).bmp"
millenium.sprites.Mov_right[i]="imagens/millenium_right (1).bmp"
millenium.sprites.Mov_left[i]="imagens/millenium_left (1).bmp"
end
millenium.sprites.Mov_up[4]="imagens/millenium_up (1).bmp"
millenium.sprites.Mov_down[4]="imagens/millenium_down (1).bmp"
millenium.sprites.Mov_right[4]="imagens/millenium_right (1).bmp"
millenium.sprites.Mov_left[4]="imagens/millenium_left (1).bmp"
