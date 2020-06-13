# VHDL Template

Template para os projetos em VHDL das disciplinas de PCS3215 (SD1) e PCS3225 (SD2).

## Organização do repositório

Os arquivos que descrevem componentes devem ficar dentro da pasta `coponent`.

Os testbenches de cada componente devem ficar dentro da pasta `testbench` e deverão ser nomeados `(component name)_tb`. Além disso, a entidade deve seguir o mesmo padrão de nomes para evitar erros no Makefile.

## Compilando e executando

Para compilar, é necessário ter instalado o [GHDL](https://github.com/ghdl/ghdl) e adicioná-lo ao PATH da shell utilizada.

### Analisar
Para analisar os componentes e testbenches, execute o comando
```bash
make analyse
```

### Verificar sintaxe
Para apenas verificar a sintaxe dos arquivos, execute
```bash
make check_syntax
```

### Limpar
Para limpar os arquivos gerados durante a compilação, execute
```bash
make clean
```

### Testar
Para testar, execute o comando
```bash
make test
```
Nesse caso, o componente que será testado é aquele com o nome salvo na variável `CPNT` do Makefile (mux_4t1 nesse exemplo), assim, é possível mudar o componente padrão direto pelo Makefile (editando o valor inicial da variável), ou na linha de comando.

Além disso, para ver o resultado da simulação em um ambiente gráfico, utiliza-se a variável VISUAL=1. Note que para utilizar esse recurso, é preciso ter o GtkWave instalado no sistema.

Assim, se quisermos indicar precisamente qual compoennte deverá ser testado e se o ambiente gráfico deve ou não ser aberto, é preciso executar

```bash
make test CPNT=mux_4t1 VISUAL=1
```
Nesse caso, o componente `mux_4t1` será testado com a testbench `mux_4t1_tb` e o GtlWave será aberto para visualizar o resultado da simulação.

OBS: Para testar o CPNT=mux_4t1, é necessário executar o arquivo mux_4t1_tb, por isso o padrão de nomenclatura deve sempre ser seguido.

## Instalando o necessário

### GHDL

Em breve

### GtkWave

Para instalar o GtkWave, basta executar os seguintes comandos.

```bash
sudo apt update
sudo apt install gtkwave
```
