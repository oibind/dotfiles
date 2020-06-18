# delete process substitution tmp file
function delete_psub_tmp
  set files /tmp/.psub.*
  if count $files > /dev/null
    rm -f /tmp/.psub.*
  end
end
