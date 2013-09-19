

r2d2 ={
	nome   = "R2-D2",
	hp     =   0   ,
    mp     =   0   ,
    exp    =   0    ,
	level  =   0    ,
	hpm    =  0   ,
	mpm    =  0   ,
	expm   =  100   ,
	x      =   500    ,
	y      =   650    ,
	dir    = "LEFT" ,
	radar  = (function (x,y)
					if(math.abs(r2d2.x-x)<25 )and (math.abs(r2d2.y-y)<25) then return true; end
					return false;
			  end),
	
	co_rotina = coroutine.create((function ()
										local ant=nil
										local estado=0
										while(true)do
											local a=coroutine.yield()
												if((not(a==ant) )and a) then
													if(true) then
														if(estado==0)then
															allegro.mensagem("Leia Hologram: ","Me ajude, Obi Wan Kenobi, voce e a minha unica esperanca!");
															allegro.mensagem("Luke: ","Eu nao conheco nenhum Obi Wan Kenobi");
															allegro.mensagem("Luke: ","Mas existe o Ben. Ben Kenobi! Irei procura-lo na caverna!");
															estado=1
														else
															allegro.mensagem("Leia Hologram: ","Me ajude, Obi Wan Kenobi, voce e a minha unica esperanca!");
														end
														luke.possuiMensagem = true
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
