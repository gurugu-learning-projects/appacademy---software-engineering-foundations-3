def vigenere_cipher(message, keys)
  alphabet = ("a".."z").to_a
  encrypted_message = ""

  message.each_char.with_index do |char, idx|
    old_pos = alphabet.index(char)
    new_pos = old_pos + keys[idx % keys.length]
    encrypted_message += alphabet[new_pos % alphabet.length]
  end

  encrypted_message
end

p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
