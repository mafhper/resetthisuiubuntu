# Script de Reset da Aparência do Ubuntu

Este script foi desenvolvido para auxiliar na restauração das configurações padrão de aparência do Ubuntu, eliminando personalizações e retornando o sistema ao seu estado visual original.

## Funcionalidades

O script realiza as seguintes operações:

- Cria um backup automático das configurações atuais
- Reseta todas as configurações do GNOME
- Remove temas personalizados
- Remove ícones personalizados
- Reseta configurações do GTK
- Restaura o tema padrão do Ubuntu (Yaru)
- Restaura o papel de parede padrão
- Restaura a fonte padrão do sistema

## Pré-requisitos

- Ubuntu (testado nas versões 20.04 LTS e posteriores)
- GNOME Desktop Environment
- Permissões de administrador (sudo)

## Instalação

1. Faça o download do script:
```bash
wget https://raw.githubusercontent.com/seu-usuario/seu-repositorio/main/reset-ubuntu.sh
```

2. Dê permissão de execução ao script:
```bash
chmod +x reset-ubuntu.sh
```

## Uso

1. Execute o script através do terminal:
```bash
./reset-ubuntu.sh
```

2. Aguarde a conclusão das operações. O script mostrará o progresso de cada etapa com indicadores coloridos:
   - ✓ Verde: Operação concluída com sucesso
   - ✗ Vermelho: Operação falhou

3. Após a conclusão, será exibido um resumo das operações realizadas.

4. Para aplicar todas as mudanças, faça logout e login novamente no sistema.

## Backup

- O script automaticamente cria um backup das configurações antes de realizar qualquer alteração
- O backup é salvo em uma pasta com o formato: `~/backup_aparencia_AAAAMMDD_HHMMSS`
- Recomenda-se manter este backup até confirmar que todas as alterações estão conforme desejado

## Detalhes das Operações

### 1. Reset do GNOME
- Reseta todas as configurações do GNOME para o padrão
- Comando: `dconf reset -f /org/gnome/`

### 2. Remoção de Temas
- Remove a pasta ~/.themes
- Remove a pasta ~/.icons

### 3. Reset do GTK
- Remove as configurações do GTK 3.0 e 4.0
- Afeta as pastas ~/.config/gtk-3.0 e ~/.config/gtk-4.0

### 4. Tema Padrão
- Restaura o tema Yaru
- Restaura o conjunto de ícones Yaru
- Remove temas de shell personalizados

### 5. Papel de Parede
- Restaura o papel de parede padrão do Ubuntu

### 6. Fonte do Sistema
- Restaura a fonte Ubuntu 11 como padrão do sistema

## Resolução de Problemas

Se encontrar algum erro durante a execução:

1. Verifique se possui permissões adequadas na pasta home
2. Certifique-se de que o GNOME está instalado e é o ambiente desktop atual
3. Verifique se todos os pacotes padrão do Ubuntu estão instalados

## Contribuição

Sinta-se à vontade para contribuir com melhorias através de Pull Requests ou reportar problemas através de Issues.

## Aviso

⚠️ Este script modifica configurações do sistema. Embora seja criado um backup automático, recomenda-se fazer um backup manual adicional antes de executar o script.

## Licença

Este script é disponibilizado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.
