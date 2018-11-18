bin_name := process-printer

.PHONY: test
test: symlink/$(bin_name)
	@./$< > arg0_from_root
	@mkdir -p folder-branch && cd folder-branch && ../$< > ../arg0_from_branch
	@[ "`diff arg0_from_root arg0_from_branch`" == "" ] || ( echo "❌ Bug is not fixed"; diff arg0_from_root arg0_from_branch )
	@echo "✅ Bug is fixed!"

.PHONY: run
run: symlink/$(bin_name)
	@echo "The following 'arg0' should not give different results"
	@echo "Calling the symbolic link from $(pwd):"
	@./$<
	@echo "Calling the symbolic link from $(pwd)/folder-branch:"
	@mkdir -p folder-branch && cd folder-branch && ../$<

symlink/$(bin_name): .build/debug/$(bin_name)
	mkdir -p symlink
	ln -s ../$< $@

.build/debug/$(bin_name):
	swift build
