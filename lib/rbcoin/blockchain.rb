module RbCoin
  class Blockchain
    def self.hash(block)
      Digest::SHA256.hexdigest(block.sort.to_h.to_json)
    end

    def initialize
      @chain                = []
      @pending_transactions = []

      puts "Creating genesis block."

      new_block
    end

    def last_block
      @chain[-1]
    end

    def new_block(previous_hash = nil)
      block = {
        index:         @chain.length,
        previous_hash: previous_hash,
        timestamp:     Time.now.utc,
        transactions:  @pending_transactions
      }

      block[:hash] = Blockchain.hash(block)

      @pending_transactions = []
      @chain.push(block)

      puts "Created block #{block[:index]}"
      block
    end

    def new_transaction(sender, recipient, amount)
      @pending_transactions.append({
        sender:    sender,
        recipient: recipient,
        amount:    amount
      })
    end
  end
end
