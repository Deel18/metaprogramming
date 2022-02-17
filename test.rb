class ToAlphaTest < Test::Unit::TestCase
    def test_strip_non_alpha_characters
        assert_equal '3 the magic number', to_alphanumeric('#3, the *Magic, Number*?')
    end
end