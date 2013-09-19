secundario ={-- todo personagem deve seguir o estilo dessa tabela
--modificaveis em tempo de co-rotina
	nome   = "Koppa",
	hp     =   100   ,
    mp     =   10   ,
    exp    =   0    ,
	level  =   0    ,
	hpm    =  100   ,
	mpm    =  100   ,
	expm   =  100   ,
	x      =   150 ,
	y      =   190    ,
	dir    = "DOWN" ,-- direção da imagem
	radar  = (function (x,y)--radar que indica se um personagem está ou não em uma area definida por radar se estiver avisa a enviando esse personagem a co-rotina através de um resume
					if(math.abs(secundario.x-x)<25 )and (math.abs(secundario.y-y)<25) then return true; end
					return false;
			  end),
	--lista de ataques usado no modo batalha
	ataques={

		{	nome = "Splash",
			tipo = "Nothing",
			dano =  0,
			img  ="imagens/splash.bmp",--foto que aparece na carta
			desc = "Ataque superpoderoso que nao faz nenhum efeito."
			--descricao do ataque
		}
	},
	co_rotina = coroutine.create((function ()--chamada periodicamente pelo jogo uma vez a cada atualização  de tela caso o retorno de yield  retorna (n  personagems que estão no radar) sendo n>=0
										local ant=nil
										while(true)do
											local a=coroutine.yield()
											if(secundario.hp<=0) then
												allegro.removerPersonagem(secundario)
											end
											if(not (a==ant)) and (a) then allegro.mensagem("Koppa: ","Parabens, voce finalmente encontrou a caverna sagrada, porem para salvar a princesa voce precisa me derrotar primeiro!")
												ant=a
												local str=allegro.mensagem("Mario: ","Voce deseja desafiar Koppa?","Sim","Nao")
												if(str=="A") then
													local cor_ = allegro.batalha(secundario)
														while(secundario.hp>0)do
															coroutine.resume(cor_,1)
															allegro.mensagem("","koppa  usou Splash")
															local _,id=coroutine.resume(cor_)
															secundario.hp=secundario.hp-principal.ataques[id].dano;
															principal.mp=principal.mp-principal.ataques[id].mp
															allegro.mensagem("","mario  usou "..principal.ataques[id].nome)
														end
													coroutine.resume(cor_,false)
													coroutine.yield()
													allegro.mensagem("Koppa: ","Eu nao acretido, voce realmente eh forte, naooooooooo...")
													secundario.expm=0
													secundario.hpm=0
													secundario.mpm=0
												end
											end
											ant= a and ant
										end
									end)),

	sprites={--conjunto de sprites pra cada movimento do personagem
		Mov_up={ "imagens/mau2.bmp" },
		Mov_down={ "imagens/mau.bmp"},
		Mov_left={ "imagens/null.bmp"},
		Mov_right={ "imagens/null.bmp"},
		Mov_a={ "imagens/mau2.bmp"},-- usado no modo batalha
		Mov_b={ "imagens/mau.bmp"},

	}


}
