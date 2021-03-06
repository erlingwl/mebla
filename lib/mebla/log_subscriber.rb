require 'active_support/log_subscriber'

# A wrapper for slingshot  elastic-search adapter for Mongoid
module Mebla
  # Handles logging
  class LogSubscriber < ActiveSupport::LogSubscriber
    # Debug message
    def mebla_debug(event)
      debug_green event.payload[:message]      
    end

    # Error message
    def mebla_error(event)
      error_red event.payload[:message]      
    end
    
    # Info message    
    def mebla_info(event)
      info_blue event.payload[:message]      
    end
    
    # Fatal message
    def mebla_fatal(event)
      fatal_magenta event.payload[:message]      
    end

    # Warning message
    def mebla_warn(event)
      warn_yellow event.payload[:message]      
    end
    
    # Unknown message
    def mebla_unknown(event)
      unknown event.payload[:message]      
    end
    
    # --
    # -------------------------------------------------------------
    # Add some colors
    # -------------------------------------------------------------
    # ++
    
    # Print a debug message to the log file
    def debug_green(msg)
      debug color(msg, LogSubscriber::GREEN)
    end
    
    # Print an error message to the log file
    def error_red(msg)
      error color(msg, LogSubscriber::RED)
    end
    
    # Print an info message to the log file
    def info_blue(msg)
      info color(msg, LogSubscriber::BLUE)
    end
    
    # Print a fatal message to the log file
    def fatal_magenta(msg)
      fatal color(msg, LogSubscriber::MAGENTA)
    end
    
    # Print a warn message to the log file
    def warn_yellow(msg)
      warn color(msg, LogSubscriber::YELLOW)
    end
    
    # Returns the main logger for Mebla
    # @return [Logger]
    def self.logger
      Mebla::Configuration.instance.logger
    end
  end    
end