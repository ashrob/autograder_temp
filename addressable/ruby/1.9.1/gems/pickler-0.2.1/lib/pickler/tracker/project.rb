class Pickler
  class Tracker
    class Project < Abstract

      attr_reader :tracker
      reader :point_scale, :week_start_day, :name, :iteration_length

      def id
        id = @id || attributes['id'] and Integer(id)
      end

      def attributes
        unless defined?(@attributes)
          self.class.superclass.instance_method(:initialize).bind(self).call(
            @attributes_fetcher.call
          )
        end
        @attributes
      end

      def initialize(tracker, attributes = {}, id = nil)
        @tracker = tracker
        if id
          @attributes_fetcher = attributes
          @id = id
        else
          super(attributes)
        end
      end

      def use_https?
        attributes['use_https'].to_s == 'true'
      end

      def story(story_id)
        raise Error, "No story id given" if story_id.to_s.empty?
        Story.new(self,tracker.get_xml("/projects/#{id}/stories/#{story_id}")["story"])
      end

      def stories(*args)
        filter = encode_term(args) if args.any?
        path = "/projects/#{id}/stories"
        path << "?filter=#{CGI.escape(filter)}" if filter
        response = tracker.get_xml(path)
        [response["stories"]].flatten.compact.map {|s| Story.new(self,s)}
      end

      def new_story(attributes = {}, &block)
        Story.new(self, attributes, &block)
      end

      def deliver_all_finished_stories
        request_xml(:put,"/projects/#{id}/stories_deliver_all_finished")
      end

      private
      def encode_term(term)
        case term
        when Array   then term.map {|v| encode_term(v)}.join(" ")
        when Hash    then term.map {|k,v| encode_term("#{k}:#{v}")}.join(" ")
        when /^\S+$/, Symbol then term
        when /^(\S+?):(.*)$/ then %{#$1:"#$2"}
        else %{"#{term}"}
        end
      end

    end
  end
end
