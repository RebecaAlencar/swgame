deathstar ={-- todo personagem deve seguir o estilo dessa tabela
--modificaveis em tempo de co-rotina
	nome   = "DeathStar",
	hp     =   100   ,
    mp     =   10   ,
    exp    =   0    ,
	level  =   0    ,
	hpm    =  100   ,
	mpm    =  100   ,
	expm   =  100   ,
	x      =   500 ,
	y      =   420    ,
	dir    = "DOWN" ,-- direção da imagem
	radar  = (function (x,y)--radar que indica se um personagem está ou não em uma area definida por radar se estiver avisa a enviando esse personagem a co-rotina através de um resume
					if(math.abs(deathstar.x-x)<25 )and (math.abs(deathstar.y-y)<25) then return true; end
					return false;
			  end),
	--lista de ataques usado no modo batalha
	ataques={

		{	nome = "TiroLaser",
			tipo = "Nothing",
			dano =  5,
			img  ="imagens/tirolaser.bmp",--foto que aparece na carta
			desc = "Tiros de Laser"
			--descricao do ataque
		},
		{	nome = "FogoImperial",
			tipo = "Nothing",
			dano =  15,
			img  ="imagens/fogoimperial.bmp",--foto que aparece na carta
			desc = "Fogo soltos pelo AT-AT presente na nave"
			--descricao do ataque
		}


	},
	co_rotina = coroutine.create((function ()--chamada periodicamente pelo jogo uma vez a cada atualização  de tela caso o retorno de yield  retorna (n  personagems que estão no radar) sendo n>=0
										local ant=nil
										while(true)do
											local a=coroutine.yield()
											if(deathstar.hp<=0) then
												allegro.removerPersonagem(deathstar)
											end
											if(not (a==ant)) and (a) then allegro.mensagem("DeathStar: ","Se afastem Rebeldes,para resgatar a princesa Leia  voces terao que destruir nosso escudo!Isso eh impossivel,pois a Death Star eh a nave mais tecnologica da galaxia")
												ant=a
												local str=allegro.mensagem("Luke: ","Voce deseja desafiar a DeathStar?","Sim","Nao")
												if(str=="A") then
													local cor_ = allegro.batalha(deathstar)
													local x=1
														while(deathstar.hp>0)do
															local id1=math.random(2)
															coroutine.resume(cor_,id1)
															allegro.mensagem("","DeathStar  usou "..deathstar.ataques[id1].nome)
															deathstar.mp=deathstar.mp-5;--perde 5 de magia
															millenium.hp=millenium.hp-deathstar.ataques[id1].dano;
															local _,id=coroutine.resume(cor_)
															deathstar.hp=deathstar.hp-millenium.ataques[id].dano;
															millenium.mp=millenium.mp-millenium.ataques[id].mp
															allegro.mensagem("","millenium  usou "..millenium.ataques[id].nome)
														end
													coroutine.resume(cor_,false)
													coroutine.yield()
													allegro.mensagem("DeathStar: ","Eu nao acretido, voce realmente conseguiu quebrar o bloqueio e invadir a deathstar!!NOOOOOOO")
													deathstar.expm=0
													deathstar.hpm=0
													deathstar.mpm=0
												end
											end
											ant= a and ant
										end
									end)),

	sprites={--conjunto de sprites pra cada movimento do personagem
		Mov_up={ "imagens/deathstar.bmp" },
		Mov_down={ "imagens/deathstar.bmp"},
		Mov_left={ "imagens/deathstar.bmp"},
		Mov_right={ "imagens/deathstar.bmp"},
		Mov_a={ "imagens/deathstar.bmp"},-- usado no modo batalha
		Mov_b={ "imagens/deathstar.bmp"},

	}


}
