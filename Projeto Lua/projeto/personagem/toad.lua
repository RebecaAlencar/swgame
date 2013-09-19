

toad ={-- todo personagem deve seguir o estilo dessa tabela
--modificaveis em tempo de co-rotina
	nome   = "toad",
	hp     =   0   ,
    mp     =   0   ,
    exp    =   0    ,
	level  =   0    ,
	hpm    =  0   ,
	mpm    =  0   ,
	expm   =  100   ,
	x      =   250    ,
	y      =   290    ,
	dir    = "LEFT" ,-- direção da imagem
	radar  = (function (x,y)--radar que indica se um personagem está ou não em uma area definida pelo radar, se estiver avisa enviando esse personagem a co-rotina através de um resume
					if(math.abs(toad.x-x)<25 )and (math.abs(toad.y-y)<25) then return true; end
					return false;
			  end),
	
	co_rotina = coroutine.create((function ()--chamada periodicamente pelo jogo uma vez a cada atualização  de tela caso o retorno de yield  retorna (n  personagems que estão no radar) sendo n>=0
										local ant=nil
										local estado=0;
										local ataque;
										while(true)do
											local a=coroutine.yield()
												if((not(a==ant) )and a) then
													if(secundario.hp>0) then
														if(estado==0)then
															allegro.mensagem("mario: ","onde esta a peach??");
															allegro.mensagem("toad: ","Mario, Koppa a rapitou ouvir dizer que ele esta na \ncaverna sagrada!");
															estado=1
														elseif(estado==1)then
															allegro.mensagem("toad: ","rapido!! encontre a caverna sagrada!");
															estado=2
														elseif(estado==2)then
															allegro.mensagem("toad: ","nao a tempo a perder salve a peach!");
															estado=1
														end
														if(not ataque)then
															allegro.mensagem("toad: ","espere eu tenho uma flor pra voce");
															if(allegro.mensagem("","deseja aceitar a flor?\n","SIM","NAO")=="A" )then
																principal.ataques[3]={nome="bolafogo",mp=20,tipo="fogo",dano=75,img="imagens/bolafogo.bmp",desc="dispara uma bola de fogo"},
																allegro.mensagem("mario: ","uhu ganhei um ataque novo!!");
																ataque=true

															else
																allegro.mensagem("toad: ","ok boa sorte entao");
															end
														end
													else
														allegro.mensagem("toad: ","parabens vc derrotou o Koppa!! va procurar a princesa :)");

													end
												end
												ant= a or nil

										end
									end)),
	sprites={--conjunto de sprites pra cada movimento do personagem
		Mov_up={ "imagens/null.bmp" },
		Mov_down={ "imagens/peach.bmp"},
		Mov_left={ "imagens/toad.bmp"},
		Mov_right={ "imagens/null.bmp"},
		Mov_a={ "imagens/null.bmp"},-- usado no modo batalha
		Mov_b={ "imagens/null.bmp"},

	}

}
