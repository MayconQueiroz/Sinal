#!/usr/bin/perl
# 1
# Escolhe qual sinal tocar, caso seja semana ou data festiva, toca sinais diferentes
# Escrito por Maycon de Queiroz em 09 de novembro de 2018

# Inicializacao
open(OT, ">Este.txt") or die "$!"; #Abre arquivo de saida para impressao
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(); #Le data e hora locais
$year += 1900; #Ano + 1900 para ano atual
$mon += 1; #Mes + 1 porque comeca em zero
print "Data: $mday/$mon/$year\n"; #Exibicao do dia atual
$Sem = int(($yday+1-$wday)/7) + 1; #Calculo da semana
$Au = int($ARGV[0]); #Aula, recebida por parametro

##################################################################
# Regras de datas festivas vao aqui
# 0 - Entrada (Primeira aula)
# 1 - Segunda aula
# 2 - Terceira aula
# 3 - Saida intervalo
# 4 - Retorno intervalo (Quarta aula)
# 5 - Quinta aula
# 6 - Saida

# 15 de marco (dia da escola)
# 22 de abril (dia da terra)
# 28 de abril (dia da educacao)
# 19 de abril (dia do exercito)
# 05 de maio  (dia da lingua portuguesa)
# 13 de maio  (abolicao da escravatura)
# 11 de junho (dia da marinha)
# 08 de julho (dia da ciencia)
# 11 de agosto (dia do estudante)

# 22 de marco (dia da agua)
if($Sem == 12){
  print "Dia da agua (22 de marco)\n";
  print OT "DC/Agua.wav";
  close(OT);
  exit;
}

# 1 de abril (dia da mentira)
if($mday == 1 && $mon == 4 && $Au == 3){
  print "Dia da mentira (1 de abril)\n";
  print OT "DC/Mentira.wav";
  close(OT);
  exit;
}

# 22 de abril (descobrimento do brasil)
if ($Sem == 16 || $Sem == 17){
  $T = $year - 1500;
  print "Descobrimento do Brasil (22 de abril). $T anos!\n";
  if ($Au == 0){
    print OT "DC/Bras1.wav";
  } elsif ($Au == 1 || $Au == 4){
    print OT "DC/Bras2.wav";
  } elsif ($Au == 2 || $Au == 5){
    print OT "DC/Bras3.wav";
  } elsif ($Au == 3){
    print OT "DC/Bras4.wav";
  } else {
    print OT "DC/Bras6.wav";
  }
  close(OT);
  exit;
}

# 29 de agosto (criacao do parana)
if($Sem == 35){
  $T = $year - 1853;
  print "Aniversario do Parana (29 de agosto). $T anos!\n";
  print OT "DC/Parana.wav";
  close(OT);
  exit;
}

# 7 de setembro (independencia)
if ($Sem == 36 || $Sem == 37){
  $T = $year - 1822;
  print "Independencia do Brasil (7 de setembro). $T anos!\n";
  if ($Au == 0){
    print OT "DC/Indep0.wav";
  } elsif ($Au == 6 || $Au == 3){
    print OT "DC/Indep6.wav";
  } else {
    print OT "DC/IndepG.wav";
  }
  close(OT);
  exit;
}

# 14 de novembro (aniversario de cascavel)
if($Sem == 46){
  $T = $year - 1951;
  print "Aniversario de Cascavel (14 de novembro). $T anos!\n";
  if ($Au == 0 || $Au == 1){
    print OT "DC/Casca1.wav";
  } elsif ($Au == 2){
    print OT "DC/Casca2.wav";
  } elsif ($Au == 3 || $Au == 5){
    print OT "DC/Casca3.wav";
  } else {
    print OT "DC/Casca4.wav";
  }
  close(OT);
  exit;
}

## Tratamento geral
print "Semana Normal\n";
print OT "Sinal.wav";
close(OT);
