module RbCoin
  class Blockchain
    def self.hash(block)
      Digest::SHA256.hexdigest(block.sort.to_h.to_json)
    end

    def self.valid_block(block)
      block[:hash][0,4] == "0000"
    end

    def initialize
      @chain                = []
      @pending_transactions = []

      puts "Creating genesis block."
      @chain.push(new_block)
    end

    def last_block
      @chain[-1]
    end

    def new_block
      block = {
        index:         @chain.length,
        nonce:         rand(10 ** 20).to_s(16),
        previous_hash: last_block && last_block[:hash],
        timestamp:     Time.now.utc,
        transactions:  @pending_transactions
      }

      block[:hash] = Blockchain.hash(block)
      @pending_transactions = []

      block
    end

    def new_transaction(sender, recipient, amount)
      @pending_transactions.append({
        sender:    sender,
        recipient: recipient,
        amount:    amount
      })
    end

    def proof_of_work
      block = nil

      while true do
        block = new_block
        break if Blockchain.valid_block(block)
      end

      @chain.push(block)

      puts "Found a new block: #{block}"
    end
  end
end
