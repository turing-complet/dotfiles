#!/usr/bin/env zsh

# 🌼 Plugin installer

ZSH_PLUGINS_DIR="${HOME}/.zsh_plugins"

typeset -A plugins
plugins=(
  zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git
  zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
  zsh-completions https://github.com/zsh-users/zsh-completions
  zsh-z https://github.com/agkozak/zsh-z.git
)


if [[ ! -d "$ZSH_PLUGINS_DIR" ]]; then
  echo "🍓 Setting up your plugins for the first time..."
  mkdir -p "$ZSH_PLUGINS_DIR"
  for name url in ${(kv)plugins}; do
    plugin_dir="${ZSH_PLUGINS_DIR}/${name}"
    if [[ -d "$plugin_dir/.git" ]]; then
      echo "🌱We have $name at home."
    else
      echo "🌸 Cloning $name from $url..."
      git clone --depth 1 "$url" "$plugin_dir"
    fi
  done
fi

# ✨ Source the plugins so everything’s ready right away
echo "☁️ refreshing plugins ..."
for plugin in "${(@k)plugins}"; do
  plugin_file="${ZSH_PLUGINS_DIR}/${plugin}/${plugin}.plugin.zsh"
  if [[ -r "$plugin_file" ]]; then
    source "$plugin_file"
    echo "🧼 Loaded $plugin!"
  else
    echo "⚠️ Couldn't find the main script for $plugin"
  fi
done

cd ~
echo "✨ All done! ✨"
