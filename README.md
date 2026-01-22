# Random User App

Aplicativo Flutter que consome a API [Random User](https://randomuser.me/) para exibir informações de usuários aleatórios, permitindo salvar dados localmente e visualizar detalhes completos de cada usuário.

---

## Funcionalidades

- Tela inicial que lista usuários aleatórios buscados da API.
- Atualização automática da lista a cada 5 segundos utilizando `Ticker`.
- Cada usuário da lista é clicável, abrindo uma tela de detalhes.
- Tela de detalhes exibe:
  - Nome completo e avatar
  - Contato (email, telefone)
  - Localização completa (rua, cidade, estado, país)
  - Login e senha
  - Data de nascimento e idade
  - Documentos e tipo de usuário
  - Nacionalidade com bandeira do país
  - Data de registro
  - Ícones correspondentes para cada informação
- Possibilidade de salvar ou remover usuários persistidos no dispositivo.
- Tela de usuários persistidos, acessível através de um botão na tela inicial.
- Persistência local usando `SharedPreferences`.

---

## Tecnologias Utilizadas

- Flutter & Dart
- Provider (gerenciamento de estado)
- SharedPreferences (persistência local)
- FontAwesome (ícones)
- http (request)
- Flag (bandeiras dos países)
- Random User API (dados de usuários aleatórios)

---

## Estrutura do Projeto
```text
lib/
  src/
    ├─ app/ # regras do app
    ├─ data/
    │ ├─ local/ # Serviços de persistência local
    │ ├─ models/ # Models das entidades
    | ├─ repositories/ # Implementação das regras de negócio
    │ └─ services/ # Serviços de API
    ├─ domain/ # Repositórios e interfaces
    ├─ utils/ # Funções auxiliares, masks, tradução de gênero
    ├─ view/ # Telas do app
    ├─ viewModel/ # ViewModels (Provider)
    └─ widgets/ # Widgets personalizados

```

---

## Como Executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/VinioVnz/random_user_app
   cd random_user_app
   
2. Instale as dependências:
   ```bash
   flutter pub get
   
3. Execute o aplicativo:
   ```bash
   flutter run

## Autor - Vinícius Bornhofen
Desenvolvedor Mobile | Flutter & Dart
[GitHub](https://github.com/VinioVnz)
[LinkedIn](https://www.linkedin.com/in/vinícius-bornhofen-896974333)
