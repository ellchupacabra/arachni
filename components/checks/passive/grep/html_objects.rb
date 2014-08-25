=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@gmail.com>
    Please see the LICENSE file at the root directory of the project.
=end

# Looks for HTML "object" tags.
#
# @author Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>
# @version 0.1.2
class Arachni::Checks::HtmlObjects < Arachni::Check::Base

    def self.regexp
        @regexp ||= /<object(.*?)>(.*?)<\/object>/im
    end

    def run
        match_and_log( self.class.regexp ) { |m| m && !m.empty? }
    end

    def self.info
        description = %q{Logs the existence of HTML object tags.
                Since Arachni can't execute things like Java Applets and Flash
                this serves as a heads-up to the penetration tester to review
                the objects in question using a different method.}
        {
            name:        'HTML objects',
            description: description,
            elements:    [ Element::Body ],
            author:      'Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>',
            version:     '0.1.1',

            issue:       {
                name:        %q{HTML object},
                cwe:         200,
                description: description,
                severity:    Severity::INFORMATIONAL
            },
            max_issues: 25
        }
    end

end
