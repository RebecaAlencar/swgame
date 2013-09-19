

ben ={
	nome   = "Ben",
	hp     =   0   ,
    mp     =   0   ,
    exp    =   0    ,
	level  =   80    ,
	hpm    =  0   ,
	estado=0,
	mpm    =  0   ,
	expm   =  100   ,
	x      =   95    ,
	y      =   70    ,
	dir    = "LEFT" ,
	radar  = (function (x,y)
					if(math.abs(ben.x-x)<25 )and (math.abs(ben.y-y)<25) then return true; end
					return false;
			  end),
	
	co_rotina = coroutine.create((function ()
										local ant=nil
										while(true)do
											local a=coroutine.yield()
												if((not(a==ant) )and a) then
													if(true) then
														print("ta aquiiiiiiiiiii",luke.possuiMensagem,estado)
														if(luke.possuiMensagem==true)then
															if(ben.estado==0)then 
																allegro.mensagem("Luke: ","Ben! Encontrei uma mensage em um droid que comprei...");
																allegro.mensagem("Luke: ","Se tratava de um tal de Obi Wan Kenobi...");
																allegro.mensagem("Ben: ","Faz tempo que eu não ouvia esse nome...Obi Wan Kenobi!,sou eu,eu sou um mestre Jedi assim como seu pai foi!");
																allegro.mensagem("Luke: ","Meu pai?Não sabia Que você o conhecia");
																allegro.mensagem(">>","Obi Wan Kenobi e Luke conversaram sobre o Pai de luke e como o jedi morreu durante a batalha");
																allegro.mensagem(">>","Luke ganhou sabre de luz!");
																allegro.mensagem(">>","Luke: +10hp");
																allegro.mensagem(">>","Luke: +10exp");
																luke.hp = luke.hp + 10;
																luke.exp = luke.exp + 30;
																ben.estado=1
															else
																allegro.mensagem("Ben: ","Vamos resgatar Leia");
															end
														else
															allegro.mensagem("Ben: ","Ola,Luke");
														end
													end
												end
												ant= a or nil
										end
									end)),
	sprites={--conjunto de sprites pra cada movimento do personagem
		Mov_up={ "imagens/ben_sprite.bmp" },
		Mov_down={ "imagens/ben_sprite.bmp"},
		Mov_left={ "imagens/ben_sprite.bmp"},
		Mov_right={ "imagens/ben_sprite.bmp"},
		Mov_a={ "imagens/ben_sprite.bmp"},-- usado no modo batalha
		Mov_b={ "imagens/ben_sprite.bmp"},

	}

}
