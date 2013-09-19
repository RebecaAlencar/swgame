--personagem
if(not allegro)then
allegro={};--tabela criada em  c
allegro.wait=(function (...)  print("addPersonagem",...)  end) -- função que recebe um “number” “n”, e espera “n” milisegundos
allegro.addPersonagem=(function (...)  print("addPersonagem",...)  end) -- função que recebe uma tabela da classe personagem e adiciona a mesma ao fluxo do jogo.
allegro.setarPrincipal=(function (...)  print("setarPrincipal",...)  end) -- função que recebe uma tabela da classe personagem e trasforma ela (o personagem em questão) na principal. Obs.: A tabela deve ser adicionada primeiro.
allegro.removerPersonagem=(function (...)  print("removerPersonagem",...)  end)--recebe uma tabela da classe personagem e remove o personagem do fluxo do jogo, retorna um Bool.
allegro.trocarFundo=(function (...)  print("trocarFundo",...)  end)-- recebe uma String com o caminho da imagem e substitui o mapa.
allegro.mensagem=(function (...)  print("mensagem",...)  end) --  usada para mostrar a comunicação com o usuário.
-- A função recebe no mínimo 2 parâmetros do tipo String, um exemplo seria allegro.mensagem("quem fala ","o que fala"). Caso apenas dois parâmetros sejam passados, 
-- ao apertar enter o usuário irá fechar a caixa de diálogo. É possível receber até quatro parâmetros a mais, caso receba indica uma escolha do usuário. 
-- Exemplo, allegro.mensagem("quem fala ","o que fala","escolha a","escolha b","escolha c","escolha d") , neste caso o retorno será uma String com o botão escolhido.
allegro.batalha=(function (...)  print("batalha",...)  end)--  função utilizada para simular o modo batalha. A função recebe uma tabela da clase personagem e retorna uma co-rotina que representa a batalha desse personagem contra o principal.
--recebe uma tabela(personagem) e retorna uma co_rotina que representa a batalha desse personagem contra o principal
--batalha=allegro.batalha(other)
--tipo de batalha é co_rotina
--(vez do usuario):
--coroutine.resume(batalha) retorna (number) id  da carta escolhida pelo usuario na tabela ataques do personagem principal
--(vez do other):
--coroutine.resume(batalha,id) mostra pro usuario o ataque escolhido por other indicado por id(number)
--(acabar  a co_rotina):
--coroutine.resume(batalha,false)
end

personagem ={-- todo personagem deve seguir o estilo dessa tabela
--modificaveis em tempo de co-rotina
	nome   = "teste",
	hp     =   10   ,
    mp     =   10   ,
    exp    =   0    ,
	level  =   0    ,
	hpm    =  100   ,
	mpm    =  100   ,
	expm   =  100   ,
	x      =   0    ,
	y      =   0    ,
	dir    = "DOWN" ,-- direção da imagem
	classe =   ""   ,
	radar  = (function (x,y)--radar que indica se um personagem está ou não em uma area definida pelo radar, se estiver avisa enviando esse personagem a co-rotina através de um resume
					return false;
			  end),
	--lista de ataques usado no modo batalha
	ataques={

		{	nome = "",
			tipo = "",
			dano =  0,
			img  ="imagens/null.bmp",--foto que aparece na carta
			desc =""
			--descricao do ataque
		}
	},
	co_rotina = coroutine.create((function ()--chamada periodicamente pelo jogo uma vez a cada atualização de tela caso o retorno de yield  retorna (n  personagems que estão no radar) sendo n>=0
										while(true)do
											local a=coroutine.yield()
											end
									end)),
	io        = coroutine.create((function (dir)--chamada apenas no modo mapa pelo personagem principal, quando alguma tecla do usuario for apertada recebe sempre uma String ("UP","DOWN","LEFT","RIGHT","A","B","C","D","ENTER"), onde de acordo com o botão apertado pode ser resumida mais uma vez ou nenhuma a cada transição de tela
										while(true)do
											dir=coroutine.yield()
										end
								end)),


-- Não modificaveis em tempo de co-rotina ( lidos apenas uma vez)
	sprites={--conjunto de sprites pra cada movimento do personagem
		Mov_up={ "imagens/null.bmp" },
		Mov_down={ "imagens/null.bmp"},
		Mov_left={ "imagens/null.bmp"},
		Mov_right={ "imagens/null.bmp"},
		Mov_a={ "imagens/null.bmp"},-- usado no modo batalha
		Mov_b={ "imagens/null.bmp"},

	}


}


lista_personagems={}
function lista_personagems.addlist (table)
        if(type(table)=="table") then
				if( not (getmetatable(table)== personagem ))then
                if(table.sprites)then
                setmetatable (table.sprites,personagem.sprites)
                end
                if(table.ataques)then
                    setmetatable (table.ataques,personagem.ataques)
					for k2,v2 in pairs(table.ataques)do
							setmetatable (v2,personagem.ataques[1])
					end
                end
				
                setmetatable (table,personagem)
				end
				allegro.addPersonagem(table);


        else
            print("tabela é esperado como argumento.")
        end

end

personagem.ataques.__newindex=(function(t,k,v)
rawset(t, k, v) 
if(not (t ==personagem.ataques))then
setmetatable (v,personagem.ataques[1])
end
end)

personagem.__newindex= (function(t,k,v)
rawset(t, k, v) --define o valor v na chave k da tabela t sem invocar qualquer metamétodo.
if((k=="sprites") and (not (t==personagem)))then
setmetatable (t.sprites,personagem.sprites)
elseif((k=="ataques") and (not( t == personagem))) then

setmetatable (t.ataques,personagem.ataques)
for k2,v2 in pairs(t.ataques)do
setmetatable (v2,personagem.ataques[1])

end

end
				end )






personagem.__index=personagem
personagem.sprites.__index=personagem.sprites
personagem.ataques.__index=personagem.ataques
personagem.ataques[1].__index=personagem.ataques[1]

allegro.trocarFundo("imagens/swlogo.bmp")

mapa1_colisoes = {{830,8},{840,18},{850,18},{850,28},{860,38},{870,48},{880,58},{890,58},{900,58},{910,58},{920,58},{930,58},{940,48},{950,38},{980,40},{990,50},{1000,60},{1010,70}}
function colide(a, x, y)
	for _, v in ipairs(a) do
		if v[1] == x and v[2] == y then
			return true
		end
	end
	return false
end

