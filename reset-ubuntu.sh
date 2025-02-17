#!/bin/bash

# Cores para feedback visual
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Função para exibir status
print_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[✓] $1${NC}"
        return 0
    else
        echo -e "${RED}[✗] $1${NC}"
        return 1
    fi
}

# Função para criar backup
create_backup() {
    backup_dir="$HOME/backup_aparencia_$(date +%Y%m%d_%H%M%S)"
    echo -e "\n${YELLOW}Criando backup em: $backup_dir${NC}"
    
    mkdir -p "$backup_dir"
    
    # Backup dos diretórios se existirem
    [ -d "$HOME/.themes" ] && cp -r "$HOME/.themes" "$backup_dir"
    [ -d "$HOME/.icons" ] && cp -r "$HOME/.icons" "$backup_dir"
    [ -d "$HOME/.config/gtk-3.0" ] && cp -r "$HOME/.config/gtk-3.0" "$backup_dir"
    [ -d "$HOME/.config/gtk-4.0" ] && cp -r "$HOME/.config/gtk-4.0" "$backup_dir"
    
    print_status "Backup criado"
}

# Array para armazenar resultados
declare -A results

echo -e "${YELLOW}Iniciando reset das configurações de aparência do Ubuntu...${NC}"
echo -e "${YELLOW}Por favor, aguarde...${NC}\n"

# Criar backup
create_backup

# Resetar configurações do GNOME
echo "Resetando configurações do GNOME..."
dconf reset -f /org/gnome/
results["gnome"]=$?
print_status "Reset das configurações do GNOME"

# Remover temas personalizados
echo -e "\nRemovendo temas personalizados..."
rm -rf ~/.themes
results["themes"]=$?
print_status "Remoção dos temas"

# Remover ícones personalizados
echo "Removendo ícones personalizados..."
rm -rf ~/.icons
results["icons"]=$?
print_status "Remoção dos ícones"

# Resetar configurações do GTK
echo -e "\nResetando configurações do GTK..."
rm -rf ~/.config/gtk-4.0
rm -rf ~/.config/gtk-3.0
results["gtk"]=$?
print_status "Reset das configurações do GTK"

# Voltar ao tema padrão do Ubuntu
echo -e "\nConfigurando tema padrão do Ubuntu..."
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
gsettings set org.gnome.shell.extensions.user-theme name ''
results["theme_default"]=$?
print_status "Configuração do tema padrão"

# Resetar papel de parede
echo -e "\nResetando papel de parede..."
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/warty-final-ubuntu.png'
results["wallpaper"]=$?
print_status "Reset do papel de parede"

# Resetar fonte
echo -e "\nResetando fonte do sistema..."
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 11'
results["font"]=$?
print_status "Reset da fonte"

# Resumo final
echo -e "\n${YELLOW}=== Resumo das Operações ===${NC}"
for key in "${!results[@]}"; do
    if [ ${results[$key]} -eq 0 ]; then
        echo -e "$(printf '%-20s' "$key"): ${GREEN}Sucesso${NC}"
    else
        echo -e "$(printf '%-20s' "$key"): ${RED}Falha${NC}"
    fi
done

echo -e "\n${YELLOW}Para aplicar todas as mudanças, faça logout e login novamente.${NC}"
echo -e "${YELLOW}Um backup das suas configurações anteriores foi criado em: $backup_dir${NC}"
