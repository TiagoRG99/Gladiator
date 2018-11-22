extends Node

const ARQUIVO = "user://save.data"

func salvar_dados(x):
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.WRITE)
	
	var dados = {"heroe value" : x }
	
	if not erro :
		arquivo.store_var(dados)
	else:
		print ("Erro ao salvar dados")
	
	arquivo.close()
	
func carregar_dados(x):
	var arquivo = File.new()
	var erro = arquivo.open(ARQUIVO, File.READ)
	
	
	if not erro :
		var dados_salvos = arquivo.get_var()
		x = dados_salvos["heroe value"]
		print (dados_salvos)
	else:
		print ("Erro ao salvar dados")
	
	arquivo.close()
	