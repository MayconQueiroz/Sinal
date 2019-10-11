#!/usr/bin/perl
use HTTP::Tiny;

# Escolhe um sinal diferente se um evento externo disser para fazer isso 
# Link: (https://raw.githubusercontent.com/MayconQueiroz/Sinal/master/Sinais.txt)

$url = "https://raw.githubusercontent.com/MayconQueiroz/Sinal/master/Sinais.txt";

$response = HTTP::Tiny->new->get($url);

#So imprime se o resultado der certo
if ($response->{success}) {
    $html = $response->{content};
    @Val = split(',', $html);

    #Primeira posicao (Rainha morreu)
    if ($Val[0] == "1"){
      open(OT, ">Este.txt") or die "$!"; #Abre arquivo de saida para impressao
      print OT "DC/Rainha.wav";
      close(OT);
      exit;
    }
}
