module Strain
  refine Array do
    def keep(&block)
      reduce([]) do |memo, val|
        block.call(val) ? memo << val : memo
      end
    end

    def discard(&block)
      reduce([]) do |memo, val|
        !block.call(val) ? memo << val : memo
      end
    end
  end
end

# must add `using Strain` before tests in test file so that the refinement
# is utilised (https://ruby-doc.org/core-2.4.1/doc/syntax/refinements_rdoc.html)
