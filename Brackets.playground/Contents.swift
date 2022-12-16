func openerOf(_ closer: Character) -> Character? {
	return [
		"}": "{",
		"]": "[",
		")": "("
	][closer]
}

func isOpener(_ opener: Character) -> Bool {
	return ["{", "[", "("]
		.contains(opener)
}

func validBrackets(_ input: String) -> Bool {
	var stack: [Character] = []
	
	for letter in input {
		if isOpener(letter) {
			stack.append(letter)
			continue
		}
		
		let opener = openerOf(letter)
		
		if opener != nil && opener != stack.popLast() {
			return false
		}
	}
	
	return stack.isEmpty
}

let valids: [Bool] = [
	"",
	"teste",
	"(Hello) (World)",
	"(Hello World)",
	"((()))",
	"((()()()))",
	"{([])}",
	"(sdsdfs{2323})"
].map(validBrackets)

let invalids: [Bool] = [
	"(",
	")",
	")(",
	")teste(",
	"(Hello) (World",
	"Hello) (World)",
	"}()}",
	"{}({)}"
].map(validBrackets)

assert(!valids.contains(false), "Some valid input was invalid! 👎")
assert(!invalids.contains(true), "Some invalid input was valid! 👎")

print("👍")
