defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @dna_map %{ 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.reduce('', fn(dna_element, acc) -> acc ++ @dna_map[[dna_element]] end)
  end
end
