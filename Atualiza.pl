#!/usr/bin/perl

# Atualizador de arquivos usando codigo hospedado em rede
# Feito por Maycon Q em 26 de marco de 2019
use LWP::Simple qw(get);

#Faz (ou tenta) uma conexao e retorna a pagina
print "Atualizando tocador de sinal...\n";
$url = "https://raw.githubusercontent.com/MayconQueiroz/Sinal/master/Escolhe.pl";
$plF = get $url;
if (!$plF){
  print "Falha ao buscar o arquivo no servidor.\nErro: $!";
  exit;
}
print "Arquivo Recebido...\n";
open(OT, ">Escolhe.pl") or die "Nao foi possivel abrir o arquivo para atualizacao\n$!"; #Abre arquivo de saida para impressao
print OT $plF;
close(OT);
print "Arquivo Atualizado... Pressione ENTER para sair ";
<STDIN>;
