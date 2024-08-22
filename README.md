# Bank Product List

## Arquitetura

- **MVVM:** A arquitetura MVVM foi escolhida por sua capacidade de organizar o código de maneira clara e coesa.

  - **Model:** Representa os dados e a lógica de negócios.
  - **View:** Responsável pela interface gráfica e pela exibição dos dados.
  - **ViewModel:** Intermedia a interação entre a View e o Model, processando os dados antes de enviá-los para a interface.

- **Orientação a Protocolos:** O uso de protocolos permite que a aplicação seja flexível e extensível. Cada ViewModel é orientado a protocolos, facilitando a criação de testes unitários e a substituição de componentes no futuro.

- **Biblioteca externas:** Não foram utilizadas nenhuma biblioteca externa no projeto.

## Pontos Fortes

- **Testabilidade:** A estrutura orientada a protocolos facilita a criação de testes unitários e de interface, garantindo a qualidade do app.
- **Modularidade:** A separação clara entre Model, View e ViewModel traz a modularidade do código, permitindo a fácil manutenção e expansão do projeto.

## Testes

- **Testes Unitários:** Foram implementados testes unitários para verificar a funcionalidade dos ViewModels e outros componentes lógicos da aplicação.

- **Testes de UI:** Testes de interface foram criados para garantir que os fluxos de navegação e a exibição dos dados estejam corretos

## Fastlane

- **Lane `beta`:** Utilizada para automatizar o processo de build e upload do app para o TestFlight.

## Como rodar
- Clone o repositório e abra o arquivo `bank-product-list.xcodeproj`
