#!/usr/bin/perl

# Atualizador de arquivos usando codigo hospedado em rede
# Feito por Maycon Q em 26 de marco de 2019
use HTTP::Tiny;

#Faz (ou tenta) uma conexao e retorna a pagina
#Tocador de sinal (Base)
print "Atualizando tocador de sinal...\n";

#O Proprio
print "Eu mesmo\n";
$url = "https://raw.githubusercontent.com/MayconQueiroz/Sinal/master/Atualiza.pl";
$response = HTTP::Tiny->new->get($url);

#So imprime se o resultado der certo
if ($response->{success}) {
  $html = $response->{content};
  open(OT, ">Atualiza.pl") or die "$!"; #Abre arquivo de saida para impressao
  print OT "$html";
  close(OT);
}

#Tocador base
print "Tocador base\n";
$url = "https://raw.githubusercontent.com/MayconQueiroz/Sinal/master/Escolhe.pl";
$response = HTTP::Tiny->new->get($url);

#So imprime se o resultado der certo
if ($response->{success}) {
  $html = $response->{content};
  open(OT, ">Escolhe.pl") or die "$!"; #Abre arquivo de saida para impressao
  print OT "$html";
  close(OT);
}

#Tocador de eventos
print "Tocador de eventos\n";
$url = "https://raw.githubusercontent.com/MayconQueiroz/Sinal/master/Eventos.pl";
$response = HTTP::Tiny->new->get($url);

#So imprime se o resultado der certo
if ($response->{success}) {
  $html = $response->{content};
  open(OT, ">Eventos.pl") or die "$!"; #Abre arquivo de saida para impressao
  print OT "$html";
  close(OT);
}

print "Arquivos Atualizados";
