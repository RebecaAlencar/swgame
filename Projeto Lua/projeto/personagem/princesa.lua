

princesa ={-- todo personagem deve seguir o estilo dessa tabela
--modificaveis em tempo de co-otina
	nome   = "Princess",
	hp     =   0   ,
    mp     =   0   ,
    exp    =   0    ,
	level  =   0    ,
	hpm    =  0   ,
	mpm    =  0   ,
	expm   =  100   ,
	x      =   150    ,
	y      =   190    ,
	dir    = "DOWN" ,-- direção da imagem
	radar  = (function (x,y)--radar que indica se um personagem está ou não em uma area definida pelo radar, se estiver avisa enviando esse personagem a co-rotina através de um resume
					if(math.abs(princesa.x-x)<25 )and (math.abs(princesa.y-y)<25) then return true; end
					return false;
			  end),
	co_rotina = coroutine.create((function ()--chamada periodicamente pelo jogo uma vez a cada atualização  de tela caso o retorno de yield  retorna (n  personagems que estão no radar) sendo n>=0
										while(true)do
											local a=coroutine.yield()
												if(a) then
													allegro.mensagem("Princess: ","Mario, voce finalmente me encontrou!")
													allegro.removerPersonagem(princesa)
													allegro.trocarFundo("imagens/over.bmp");
													principal.hpm=0
													principal.expm=0
													principal.mpm=0
												end
											end
									end)),
	
	sprites={--conjunto de sprites para cada movimento do personagem
		Mov_up={ "imagens/null.bmp" },
		Mov_down={ "imagens/peach.bmp"},
		Mov_left={ "imagens/null.bmp"},
		Mov_right={ "imagens/null.bmp"},
		Mov_a={ "imagens/null.bmp"},-- usado no modo batalha
		Mov_b={ "imagens/null.bmp"},

	}

}
