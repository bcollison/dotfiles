# Load supplementary scripts
#source ~/.bashrc.d/variables.bash
#source ~/.bashrc.d/path.bash
#source ~/.bashrc.d/aliases.bash
#source ~/.bashrc.d/prompt.bash
#source ~/.bashrc.d/utils.bash
#source ~/.bashrc.d/bcollison-verve.bash
#source ~/.bashrc.d/work.bash.private
#source ~/.bashrc.local

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

function curl() {
  local use_netrc=false
  local args=()

  # Scan arguments for -n or --netrc
  for arg in "$@"; do
    if [[ "$arg" == "-n" || "$arg" == "--netrc" ]]; then
      use_netrc=true
    else
      args+=("$arg")
    fi
  done

  if [ "$use_netrc" = true ]; then
    # Call curl with the decrypted netrc file and remaining arguments
    command curl --netrc-file <(gpg --batch -q -d ~/.netrc.gpg) "${args[@]}"
  else
    # Call curl normally
    command curl "$@"
  fi
}
export -f curl

function ncurl() {
  local use_netrc=false
  local args=()

  # Scan arguments for -n or --netrc
  for arg in "$@"; do
    if [[ "$arg" == "-n" || "$arg" == "--netrc" ]]; then
      use_netrc=true
    else
      args+=("$arg")
    fi
  done

  if [ "$use_netrc" = true ]; then
    # Call curl with the decrypted netrc file and remaining arguments
    command curl --netrc-file <(gpg --batch -q -d ~/.netrc.gpg) "${args[@]}"
  else
    # Call curl normally
    command curl "$@"
  fi
}
export -f ncurl
. "$HOME/.cargo/env"
