#Gabriel Boechat; Economia PUC-Rio
#GitHub: https://github.com/gabrielboechat
#Twitter: https://twitter.com/gab_boechat
#LinkedIn: https://www.linkedin.com/in/gabriel-boechat/



#SETOR P�BLICO - REGIME DE PR�PRIO DE PREVID�NCIA SOCIAL (A PARTIR DE AGORA RPPS) - 10/2019

#source: http://www.previdencia.gov.br/dados-abertos/estatisticas-e-informacoes-dos-rpps/

#Bibliotecas utilizadas:

library(rmarkdown)
library(AER)
library(stats)
library(MASS)
library(scales)
library(haven)
library(descr)
library(tidyverse)
library(ggplot2)
library(RColorBrewer)


# Para RPPS em geral, arquivos ser�o listados como:

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#aliquota: representam dados gerais como quantidade de pessoas jur�dicas com as mesmas caracter�sticas previdenci�rias, dividindo entre servidores do Estado e Munic�pios. Porcentagem da al�quota tamb�m � observada para cada agregado
file.head("C:\\Users\\gabri\\Desktop\\Ci�ncias Econ�micas\\Per�odo IV\\Economia do Setor P�blico\\Trabalhos\\semin�rio previd�ncia\\dados\\DADOS-GERAIS-Aliquotas-de-Contribuicao-Praticadas.csv")

aliquota = read.csv("C:\\Users\\gabri\\Desktop\\Ci�ncias Econ�micas\\Per�odo IV\\Economia do Setor P�blico\\Trabalhos\\semin�rio previd�ncia\\dados\\DADOS-GERAIS-Aliquotas-de-Contribuicao-Praticadas.csv", sep = ";", dec = ".", header = TRUE, quote = "")

names(aliquota) = c("CNPJ","Ente","UF","Plano de Segrega��o","Sujeito Passivo","Al�quota","In�cio de Vig�ncia","Fim de Vig�ncia")

aliquota



#historico: representam dados sobre munic�pios e estados que participam de RPPS ou RGPS, al�m de dados jur�dicos sobre a legisla��o em cada Ente e/ou uF 
file.head("C:\\Users\\gabri\\Desktop\\Ci�ncias Econ�micas\\Per�odo IV\\Economia do Setor P�blico\\Trabalhos\\semin�rio previd�ncia\\dados\\DADOS-GERAIS-Historico-de-Regimes-Previdenciarios.csv")

historico = read.csv("C:\\Users\\gabri\\Desktop\\Ci�ncias Econ�micas\\Per�odo IV\\Economia do Setor P�blico\\Trabalhos\\semin�rio previd�ncia\\dados\\DADOS-GERAIS-Historico-de-Regimes-Previdenciarios.csv", sep = ";", dec = ".", header = TRUE, quote = "")

names(historico) = c("CNPJ","UF","Ente","Regime","Data de In�cio do Regime","Data de Fim do Regime","Tipo de Documento","N�mero (sem Ano)","Data do Documento","Data da Publica��o","Data de In�cio da Vig�ncia","Ementa","Lei que revogou","SERVIDOR AMPARADO","NM_ARTIGO_INICIO")

historico



#regimes: vers�o concisa da tabela anterior, representando quantidade de RGPS e RPPS por UF
file.head("C:\\Users\\gabri\\Desktop\\Ci�ncias Econ�micas\\Per�odo IV\\Economia do Setor P�blico\\Trabalhos\\semin�rio previd�ncia\\dados\\DADOS-GERAIS-Quantidade-de-Regimes-por-UF.csv")

regimes = read.csv("C:\\Users\\gabri\\Desktop\\Ci�ncias Econ�micas\\Per�odo IV\\Economia do Setor P�blico\\Trabalhos\\semin�rio previd�ncia\\dados\\DADOS-GERAIS-Quantidade-de-Regimes-por-UF.csv", sep = ";", dec = ".", header = TRUE, quote = "")

names(regimes) = c("UF","RGPS","RPPS","RPPS em Extin��o")

regimes



#regime_ente: para cada munic�pio, representa se tem RPPS ou RGPS
file.head("C:\\Users\\gabri\\Desktop\\Ci�ncias Econ�micas\\Per�odo IV\\Economia do Setor P�blico\\Trabalhos\\semin�rio previd�ncia\\dados\\DADOS-GERAIS-Regime-Previdenciario-dos-Entes-Federativos.csv")

regime_ente = read.csv("C:\\Users\\gabri\\Desktop\\Ci�ncias Econ�micas\\Per�odo IV\\Economia do Setor P�blico\\Trabalhos\\semin�rio previd�ncia\\dados\\DADOS-GERAIS-Regime-Previdenciario-dos-Entes-Federativos.csv", sep = ";", dec = ".", header = TRUE, quote = "")

names(regime_ente) = c("CNPJ","UF","Ente Federativo","Regime")

regime_ente



# Para observar o data.frame em sua totalidade, usar a fun��o view("data.frame"), com seu respectivo nome

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Agora, estamos interessados em fazer apresenta��es gr�ficas dos dados listados acima.

#Gr�fico n�1: Propor��o de RPPS para cada UF

ggplot(data = regime_ente) +
  geom_bar(mapping = aes(x = regime_ente$UF, fill = regime_ente$Regime), position = "fill") +
  coord_flip() +
  xlab("Unidade Federativa") +
  ylab("Propor��o") +
  labs(caption = "Fonte: Portal da Previd�ncia
       Elabora��o: Gabriel Boechat") +
  ggtitle("Propor��o do RPPS para cada Unidade Federativa") +
  scale_fill_brewer(name = "Regime Previdenci�rio", palette = "Pastel2", labels = c("RGPS", "RPPS", "RPPS em Extin��o")) +
  theme_classic()



# OBS:

library(RColorBrewer)

# Para rodar todas as paletas de cores:

display.brewer.all()



#Gr�fico n�2: Propor��o dos servidores

ggplot(data = aliquota) +
  geom_bar(mapping = aes(x = aliquota$UF, fill = aliquota$`Sujeito Passivo`), position = "fill") +
  coord_flip() +
  xlab("Unidade Federativa") +
  ylab("Propor��o") +
  labs(caption = "Fonte: Portal da Previd�ncia
       Elabora��o: Gabriel Boechat") +
  scale_fill_brewer(name = "Sujeito Passivo", palette = "Pastel2") +
  ggtitle("Qual propor��o do car�ter passivo dos pertencentes ao regime?") +
  theme_bw()
  
