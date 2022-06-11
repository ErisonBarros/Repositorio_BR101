# Repositorio_BR101 no MKdocs

https://imasters.com.br/desenvolvimento/mkdocs-documentacao-de-projetos-com-markdown

O _MkDocs_ é um gerador de site estático minimalista e muito simples de usar. Ele funciona de maneira semelhante a outros geradores como _Pelican_ e _Jenkill_, entretanto, diferente desses, o _MkDocs_ é voltado à criação de documentação ao invés de blogs.

Os sites contruídos com o _MkDocs_ podem ser hospedados facilmente em muitos lugares, inclusive utilizando o _github pages_.

## Instalação

O _MKDocs_ possui suporte para as versões 2.6, 2.7, 3.3, 3.4, 3.5 do Python. A sua instalação é semelhante a outros pacotes Python.

```
pip install mkdocs
```

Podemos utilizar o seguinte comando para verificar se tudo foi instalado corretamente:

```
mkdocs --version
```

Se tudo estiver funcionado corretamente, o resultado do comando será a versão do _MkDocs_ instalado.

## Criando o projeto

A utilização do _MkDocs_ é bem simples. Inicialmente criamos o nosso projeto com:

```
mkdocs new my-project
cd my-project
```

Dentro da pasta _my-projet_ teremos a seguinte estrutura de diretórios:

```
.
├── docs
│   └── index.md
└── mkdocs.yml
```

Todas as páginas do seu site serão armazenadas dentro da pasta _docs_. Inclusive dentro dessa mesma pasta existe o arquivo _index.md_. Este arquivo será a página principal do site. Além do diretório _docs_, também temos o arquivo _mkdocs.yml_, que é o arquivo de configuração utilizado pelo _MkDocs_.

## Servidor de desenvolvimento

O _MkDocs_ possui um servidor de desenvolvimento, que nos permite pré-visualizar nossa documentação. Para utilizar entre com o comando:

```
mkdocs serve
```

Veremos algo semelhante em nosso terminal:

```
INFO    -  Building documentation...
INFO    -  Cleaning site directory
[I 170125 15:05:33 server:283] Serving on http://127.0.0.1:8000
[I 170125 15:05:33 handlers:60] Start watching changes
[I 170125 15:05:33 handlers:62] Start detecting changes
```

Um ponto interessante deste servidor de desenvolvimento é que ele atualiza automaticamente o conteúdo exibido na página sem necessidade de reiniciá-lo. Sendo necessário apenas atualizar a página do navegador. Uma vez que o servidor esteja sendo executado, podemos acessar o site de documentação no navegador pelo seguinte endereço: _http://localhost:8000/_ ou _http://127.0.0.1:8000_

[![](https://static.imasters.com.br/wp-content/uploads/2017/01/snapshot_46-620x279.png)](https://imasters.com.br/?attachment_id=111048)

## Adicionado novas paginas

A página da imagem acima é o conteúdo do _index.md_. Podemos adicionar outra página facilmente editando a tag `pages` presente no arquivo _mkdocs.yml_.

```
site_name: My Docs
pages:
    - Home: index.md
    - About: about.md
```

Em seguida, criamos um arquivo `about.md` dentro da pasta `docs` e atualizamos a página no navegador para que o menu aparecera no topo do site, nos permitindo navegar entre as páginas.

[![](https://static.imasters.com.br/wp-content/uploads/2017/01/snapshot_47.png)](https://imasters.com.br/?attachment_id=111049)

## Outras configurações

Para trocarmos o nome do site, basta alterarmos o nome presente na tag site\_name. Também podemos trocar o tema do site através da tag theme. O MkDocs vem com alguns temas próprios, que são os temas mkdocs (utilizado neste tutorial) e o readthedocs (utilizado muito em documentação de api Python). Também existem temas feitos por terceiros, que podem ser encontrados aqui. Para utilizá-los siga as instruções de instalação de cada tema.

## Compilando

Quando o site de documentação estiver pronto, o próximo passo é compilá-lo. Isso é feito através do comando:

```
mkdocs build
```

Um diretório chamato `site` será criado.

```
about
css
fonts
img
js
mkdocs
404.html
index.html
sitemap.xml
```

O conteúdo deste diretório é o nosso site em si, pronto para ser hospedado no _github-pages_ (o seu conteúdo pode ser lançado na _branch_ `gh-pages`) ou em outro servidor, de acordo com a preferência.

O _MkDocs_ possui um comando onde ele compila o site e já o envia para o _github-pages_. Para mais informações, dê uma olhada na documentação (em inglês) [aqui](http://www.mkdocs.org/user-guide/deploying-your-docs/).

### Conclusão

Chegamos ao fim de mais um artigo. Este foi bem curto, apenas para apresentar o _mkdocs_. Futuramente, pretendo fazer outro explicando como realizar o deploy no _github-pages_ e, inclusive, como automatizar esse processo.

Eu recentemente utilizei o _MkDocs_ no site/documentação do meu leitor de quadrinhos _Pynocchio_ [aqui](https://pynocchio.github.io/).

É isso, pessoal! Obrigado por ler até aqui.

Até o próximo artigo!

### Referências

-   [Documentação MKDocs (inglês)](http://www.mkdocs.org/)
