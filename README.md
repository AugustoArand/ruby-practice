# ruby-practice
Repositório dedicado a atividade de prática da linguagem Ruby

## Exercícios Realizados

### 1. **Autenticador Simples** (`autenticator.rb`)
- **Conceitos abordados:**
  - Arrays e Hashes
  - Loops (`while`)
  - Estruturas condicionais (`if/else`)
  - Entrada do usuário (`gets.chomp`)
  - Iteração com `.each`
  - Controle de tentativas de login
  - Validação de credenciais

### 2. **Autenticador Robusto** (`robust_authenticator.rb`)
- **Conceitos abordados:**
  - Funções/métodos personalizados
  - Biblioteca `io/console` para entrada segura de senha
  - Modularização de código
  - Menu interativo pós-login
  - Funcionalidade de alteração de senha
  - Estrutura `case/when`
  - Método `.find` para busca em arrays
  - Validação de entrada do usuário

### 3. **Sistema de Códigos de Área** (`dial.rb`)
- **Conceitos abordados:**
  - Hash como estrutura de dados principal
  - Métodos para manipulação de Hash (`.keys`)
  - Loops infinitos (`loop do`)
  - Controle de fluxo com `break`
  - Funções para busca e recuperação de dados
  - Tratamento de casos onde dados não são encontrados

### 4. **Programação Orientada a Objetos** (`oop.rb`)
- **Conceitos abordados:**
  - Definição de classes (`class`)
  - Método construtor (`initialize`)
  - Atributos de instância (`@variable`)
  - Acessores (`attr_accessor`)
  - Criação e manipulação de objetos
  - Interpolação de strings

### 5. **Autenticação com BCrypt** (`bcrypt_crud.rb`)
- **Conceitos abordados:**
  - Módulos (`module`)
  - Gem BCrypt para hash de senhas
  - Segurança em autenticação
  - Criptografia de senhas
  - CRUD básico para usuários
  - Funções para criação e verificação de hash
  - Iteração e transformação de dados

### 6. **Arrays Completo** (`arrays.rb`)
- **Conceitos abordados:**
  - **Criação de arrays:** literal, `Array.new`, ranges, `%w[]`
  - **Acesso a elementos:** índices positivos/negativos, `first`, `last`, ranges
  - **Manipulação:** `push`, `pop`, `shift`, `unshift`, `delete`, `delete_at`
  - **Consulta:** `size`, `length`, `empty?`, `include?`, `index`, `count`
  - **Iteração:** `each`, `each_with_index`, `reverse_each`
  - **Transformação:** `map`, `collect`, `select`, `reject`, `compact`, `uniq`, `flatten`
  - **Redução:** `reduce`, `inject`, `sum`, `min`, `max`, `minmax`
  - **Ordenação:** `sort`, `sort_by`, `reverse`
  - **Combinação:** `+`, `|`, `&`, `-`, `zip`
  - **Métodos booleanos:** `all?`, `any?`, `none?`, `one?`
  - **Particionamento:** `partition`, `group_by`, `take`, `drop`, `take_while`, `drop_while`
  - **Conversão:** `join`, `to_h`, `to_s`, `inspect`
  - **Métodos avançados:** `sample`, `shuffle`, `rotate`, `transpose`, `combination`, `permutation`
  - **Modificação in-place:** métodos com `!` (`sort!`, `map!`, `reverse!`, etc.)
  - **Exemplo prático:** processamento de dados de vendas

### 7. **Expressões Regulares** (`regex.rb`)
- **Conceitos abordados:**
  - Regex básico em Ruby
  - Pattern matching
  - Validação de formatos

## Tecnologias e Conceitos Gerais Abordados
- **Ruby básico:** sintaxe, tipos de dados, operadores
- **Estruturas de controle:** loops, condicionais, iteradores
- **Estruturas de dados:** Arrays (15+ métodos), Hashes, Classes
- **Programação orientada a objetos:** classes, objetos, atributos
- **Programação funcional:** `map`, `reduce`, `select`, `reject`, blocks
- **Modularização:** funções, métodos, módulos
- **Segurança:** hash de senhas, entrada segura
- **Boas práticas:** organização de código, reutilização
- **Bibliotecas externas:** BCrypt, IO::Console
- **Manipulação de dados:** transformação, filtragem, agregação, ordenação

## Como Executar
```bash
# Executar qualquer arquivo
ruby nome_do_arquivo.rb

# Exemplos:
ruby arrays.rb          # Demonstração completa de arrays
ruby oop.rb            # Exemplos de OOP
ruby bcrypt_crud.rb    # Sistema com BCrypt
```

## Recursos de Aprendizado
Este repositório cobre desde conceitos básicos até intermediários de Ruby, incluindo:
- ✅ Sintaxe e estruturas básicas
- ✅ Estruturas de dados (Arrays com 60+ exemplos práticos)
- ✅ Programação Orientada a Objetos
- ✅ Autenticação e Segurança
- ✅ Manipulação e transformação de dados
- ✅ Expressões regulares