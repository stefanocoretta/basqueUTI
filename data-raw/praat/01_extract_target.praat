aligned$ = "../raw/aligned"

files = Create Strings as file list: "files", "'aligned$'/*.TextGrid"
files_n = Get number of strings

for file from 1 to files_n
  selectObject: files
  file$ = Get string: file
  Read from file: "'aligned$'/'file$'"

  # Tier 1 has words
  lab$ = Get label of interval: 1, 1

  if lab$ == ""
    target = 4
  else
    target = 3
  endif

  Insert interval tier: 3, "targets"
  target_start = Get start time of interval: 1, target
  target_end = Get end time of interval: 1, target

  first_int = Get interval at time: 2, target_start
  last_int = Get interval at time: 2, target_end
  last_int -= 1

  for int from first_int to last_int
    int_start = Get start time of interval: 2, int
    int_end = Get end time of interval: 2, int
    int_lab$ = Get label of interval: 2, int

    Insert boundary: 3, int_start
    target_int_start = Get interval at time: 3, int_start
    Set interval text: 3, target_int_start, int_lab$ 
  endfor

  Insert boundary: 3, target_end
  Remove tier: 1
  Remove tier: 1
  Save as text file: "../raw/aligned_target/'file$'"
endfor