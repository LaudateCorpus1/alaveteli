require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EximLog do
    describe ".load_file" do
        it "loads relevant lines of an uncompressed exim log file" do
            Configuration.stub!(:incoming_email_domain).and_return("example.com")
            File.stub_chain(:stat, :mtime).and_return(Date.new(2012, 10, 10))
            log = ["This is a line of a logfile relevant to foi+request-1234@example.com"]
            File.should_receive(:open).with("/var/log/exim4/exim-mainlog-2012-10-10", "r").and_return(log)
            ir = info_requests(:fancy_dog_request)
            InfoRequest.should_receive(:find_by_incoming_email).with("request-1234@example.com").and_return(ir)
            EximLog.load_file("/var/log/exim4/exim-mainlog-2012-10-10")

            ir.exim_logs.count.should == 1
            log = ir.exim_logs.first
            log.order.should == 1
            log.line.should == "This is a line of a logfile relevant to foi+request-1234@example.com"
        end
    end
end
