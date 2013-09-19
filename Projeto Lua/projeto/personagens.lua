--personagem são declarados aqui
do
if(not allegro) then
loadfile("metatabela.lua")()end
end

--loadfile("personagem/principal.lua")()
--loadfile("personagem/secundario.lua")()
loadfile("personagem/luke.lua")()
loadfile("personagem/r2d2.lua")()
loadfile("personagem/ben.lua")()
loadfile("personagem/deathstar.lua")()
loadfile("personagem/millenium.lua")()
loadfile("colisoes.lua")()
--loadfile("personagem/princesa.lua")()
--loadfile("personagem/toad.lua")()
lista_personagems.addlist(luke)-- registra a tabela e faz a herança
allegro.setarPrincipal(luke)
lista_personagems.addlist(r2d2)
