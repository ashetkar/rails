# frozen_string_literal: true

require "active_support/core_ext/digest"

module ActiveRecord
  # This abstract class specifies the interface of transaction objects, and the
  # null object +current_transaction+ may return.
  #
  # Any other methods not specfied here are considered to be private interface.
  class Transaction
    class Callback # :nodoc:
      def initialize(event, callback)
        @event = event
        @callback = callback
      end

      def before_commit
        @callback.call if @event == :before_commit
      end

      def after_commit
        @callback.call if @event == :after_commit
      end

      def after_rollback
        @callback.call if @event == :after_rollback
      end
    end

    def initialize # :nodoc:
      @callbacks = nil
      @uuid = nil
    end

    # Registers a block to be called before the current transaction is fully committed.
    #
    # If the current transaction has a parent transaction, the callback is transferred to
    # the parent when the current transaction commits, or dropped when the current transaction
    # is rolled back. This operation is repeated until the outermost transaction is reached.
    #
    # The null object executes this callback immediately.
    def before_commit(&block)
      (@callbacks ||= []) << Callback.new(:before_commit, block)
    end

    # Registers a block to be called after the current transaction is fully committed.
    #
    # If the current transaction has a parent transaction, the callback is transferred to
    # the parent when the current transaction commits, or dropped when the current transaction
    # is rolled back. This operation is repeated until the outermost transaction is reached.
    #
    # The null object executes this callback immediately.
    def after_commit(&block)
      (@callbacks ||= []) << Callback.new(:after_commit, block)
    end

    # Registers a block to be called after the current transaction is rolled back.
    #
    # If the current transaction is successfully committed but has a parent
    # transaction, the callback is automatically added to the parent transaction.
    #
    # If the entire chain of nested transactions are all successfully committed,
    # the block is never called.
    #
    # The null object does not execute this callback.
    def after_rollback(&block)
      (@callbacks ||= []) << Callback.new(:after_rollback, block)
    end

    # Returns a UUID for this transaction.
    #
    # The null object has a {nil UUID}[https://en.wikipedia.org/wiki/Universally_unique_identifier#Special_UUIDs].
    def uuid
      @uuid ||= Digest::UUID.uuid_v4
    end

    protected
      def append_callbacks(callbacks)
        (@callbacks ||= []).concat(callbacks)
      end
  end
end
