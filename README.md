# Portfolio

Portfolio web de Jefferson Machado, desenvolvido em Flutter Web para apresentar perfil profissional, 
habilidades, projetos e formas de contato de um desenvolvedor.

O projeto foi criado para rodar apenas na web. Não há configuração ou intenção de build para Android, 
iOS, desktop ou outras plataformas neste repositório.

## Tecnologias

- Flutter Web
- Dart
- Material
- GoRouter para rotas
- Riverpod para gerenciamento de estado
- Flutter Localizations e `intl` para internacionalização
- Flutter SVG para renderização de arquivos SVG
- Lucide Icons Flutter para ícones
- Fonte Outfit

## Pré-requisitos

- Flutter instalado com suporte a Web habilitado
- Dart compatível com o SDK definido em `pubspec.yaml`
- Chrome ou outro navegador disponível para execução local

Verifique o ambiente com:

```bash
flutter doctor
flutter devices
```

## Instalação

Instale as dependências do projeto:

```bash
flutter pub get
```

## Internacionalização

Os arquivos de tradução ficam em `lib/l10n`:

- `app_pt.arb`
- `app_en.arb`

A configuração do gerador está em `l10n.yaml`:

```yaml
arb-dir: lib/l10n
template-arb-file: app_pt.arb
output-localization-file: app_localizations.dart
```

Para gerar ou atualizar os arquivos de localização, rode:

```bash
flutter gen-l10n
```

O projeto usa `flutter: generate: true` no `pubspec.yaml`, então a geração também pode acontecer junto de comandos do Flutter, como `flutter run`, quando necessário.

## Rodando localmente

Execute o projeto no Chrome:

```bash
flutter run -d chrome
```

Para escolher outro dispositivo web disponível, liste os devices:

```bash
flutter devices
```

E rode informando o device desejado:

```bash
flutter run -d <device-id>
```

## Build web

Gere uma versão de produção para web:

```bash
flutter build web
```

Os arquivos finais serão gerados em:

```text
build/web
```

## Testes e análise

Rode os testes automatizados:

```bash
flutter test
```

Rode a análise estática:

```bash
flutter analyze
```

## Estrutura principal

```text
lib/
  main.dart
  core/
    design/
    localization/
    router/
  src/
    contacts/
    home/
    home_menu/
    language_selector/
    projects/
    skills/
    widgets/
  l10n/
assets/
  fonts/
  images/
web/
```

## Assets

O projeto inclui:

- Fonte Outfit em `assets/fonts`
- Imagens SVG em `assets/images`
- Arquivos web em `web`, incluindo `index.html`, manifesto e ícones
